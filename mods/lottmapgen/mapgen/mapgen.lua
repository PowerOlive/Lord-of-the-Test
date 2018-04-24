local np_temp = {
	offset = 0,
	scale = 1,
	spread = {x=512, y=512, z=512},
	seed = 9130,
	octaves = 3,
	persist = 0.5
}

local np_humid = {
	offset = 0,
	scale = 1,
	spread = {x=512, y=512, z=512},
	seed = -5500,
	octaves = 3,
	persist = 0.5
}

local np_ter = {
	offset = 0,
	scale = 1,
	spread = {x=256, y=256, z=256},
	seed = 543213,
	octaves = 4,
	persist = 0.7
}

local np_terflat = {
	offset = 0,
	scale = 1,
	spread = {x=1024, y=1024, z=1024},
	seed = 543213,
	octaves = 1,
	persist = 0.5
}

local np_dec = {
	offset = 0,
	scale = 1,
	spread = {x = 92, y = 92, z = 92},
	seed = 345432,
	octaves = 2,
	persist = 0.5,
}

local np_cave = {
	offset = 0,
	scale = 1,
	spread = {x=40, y=18, z=40},
	octaves = 2,
	seed = -11842,
	persist = 0.7,
	flags = "eased",
	eased = true,
}

local np_rav = {
	offset = 0,
	scale = 1,
	spread = {x=30, y=160, z=140},
	octaves = 3,
	seed = 94927,
	persist = 0.7,
	flags = "eased",
}

-- Stuff
local modpath = minetest.get_modpath("lottmapgen")
local nobj_temp = nil
local nobj_humid = nil
local nobj_ter = nil
local nobj_terflat = nil
local nobj_dec = nil
local nobj_cave = nil
local nobj_rav = nil
local nvals_x = {}
local nvals_z = {}
local nvals_ter = {}
local nvals_terflat = {}
local nvals_dec = {}
local nvals_cave = {}
local nvals_rav = {}
local data = {}
local p2data = {}
local heightmap = {}

local times = {}

local get_mapgen_object = minetest.get_mapgen_object
function minetest.get_mapgen_object(param)
	if param == "heightmap" then
		return heightmap
	end
	return get_mapgen_object(param)
end

-- On generated function
minetest.register_on_generated(function(minp, maxp, seed)
	if minp.y < -31000 or minp.y > 5000 then
		return
	end

	local t1 = os.clock()
	local x1 = maxp.x
	local y1 = maxp.y
	local z1 = maxp.z
	local x0 = minp.x
	local y0 = minp.y
	local z0 = minp.z

	local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")
	local area = VoxelArea:new{MinEdge=emin, MaxEdge=emax}
	vm:get_data(data)
	vm:get_param2_data(p2data)

	local c_air = minetest.get_content_id("air")
	local c_tmp = minetest.get_content_id("lottmapgen:tmp") -- For caves.
	local c_sand = minetest.get_content_id("lottitems:sand")
	local c_stone = minetest.get_content_id("lottitems:stone")
	local c_water = minetest.get_content_id("lottitems:water_source")
	local c_lava = minetest.get_content_id("lottitems:lava_source")
	local c_morwat = minetest.get_content_id("lottitems:mordor_water_source")

	local c_morstone = minetest.get_content_id("lottitems:mordor_stone")
	local c_salt = minetest.get_content_id("lottores:mineral_salt")
	local c_pearl = minetest.get_content_id("lottores:mineral_pearl")

	local sidelen = x1 - x0 + 1
	local chulens = {x=sidelen, y=sidelen, z=sidelen}
	local minposxz = {x=x0, y=z0}
	local minposxyz = {x=x0, y=y0, z=z0}
	local border_amp = 128

	nobj_temp = nobj_temp or minetest.get_perlin_map(np_temp, chulens)
	nobj_humid = nobj_humid or minetest.get_perlin_map(np_humid, chulens)
	nobj_ter = nobj_ter or minetest.get_perlin_map(np_ter, chulens)
	nobj_terflat = nobj_terflat or minetest.get_perlin_map(np_terflat, chulens)
	nobj_dec = nobj_dec or minetest.get_perlin_map(np_dec, chulens)
	nobj_cave = nobj_cave or minetest.get_perlin_map(np_cave, chulens)
	nobj_rav = nobj_rav or minetest.get_perlin_map(np_rav, chulens)

	nobj_temp:get2dMap_flat(minposxz, nvals_x)
	nobj_humid:get2dMap_flat(minposxz, nvals_z)
	nobj_ter:get2dMap_flat(minposxz, nvals_ter)
	nobj_terflat:get2dMap_flat(minposxz, nvals_terflat)
	nobj_dec:get2dMap_flat(minposxz, nvals_dec)
	nobj_cave:get3dMap_flat(minposxyz, nvals_cave)
	nobj_rav:get3dMap_flat(minposxyz, nvals_rav)

	local offset = math.random(5,20)
	local nixyz = 1
	local nixz = 1
	local schems = {}
	local h
	heightmap = {}

	for z = z0, z1 do
		for y = y0, y1 do -- Caves
			local vi = area:index(x0, y, z)
			for x = x0, x1 do -- for each node do
				local cave_d = 0.6
				if y > 10 then
					cave_d = 1.2
				elseif y <= 10 and y >= -50 then
					cave_d = y/100 + 1.1
				end
				if nvals_cave[nixyz] > cave_d then
					data[vi] = c_tmp
				elseif nvals_rav[nixyz] > 1.35 then
					data[vi] = c_tmp
				end
				vi = vi + 1
				nixyz = nixyz + 1
			end
		end
		for x = x0, x1 do -- for each column do
			local n_x = x + math.floor(nvals_x[nixz] * border_amp) -- Biome edge noise.
			local n_z = z + math.floor(nvals_z[nixz] * border_amp)
			local noise_1 = nvals_dec[nixz]
			local biome, grassp2 = lottmapgen.biomes(n_x, n_z - 1)
			local height = lottmapgen.height(n_x, n_z - 1)
			local stone_depth = math.floor(((nvals_ter[nixz] + 1)) *
				(height * math.abs(math.abs(nvals_terflat[nixz] / (height / 20)) - 1.01)))
			local underwater = -math.floor(math.abs(noise_1) * 5) - 7
			for y = y1, y0, -1 do -- working down each column for each node do
				local fimadep = math.floor(6 - y / 512) + math.random(0, 1)
				local vi = area:index(x, y, z)
				local nodid = data[vi]
				local viuu = area:index(x, y - 1, z)
				local nodiduu = data[viuu]
				local via = area:index(x, y + 1, z)
				local nodida = data[via]
				if biome == 99 then
					if y < underwater then
						data[vi] = c_stone
					elseif y == underwater then
						data[vi] = c_sand
					elseif y < 1 then
						data[vi] = c_water
					end
					heightmap[nixz] = 0
				elseif biome == 98 then
					if y < underwater then
						data[vi] = c_morstone
					elseif y < 1 then
						data[vi] = c_morwat
					end
					heightmap[nixz] = y
				elseif data[vi] == c_tmp then
					data[vi] = c_air
					if nvals_dec[nixz] > 0.5 and y < -154 then
						data[vi] = c_lava
					end
				elseif y == stone_depth and y >= 0 then
					if biome and lottmapgen.biome[biome] then
						heightmap[nixz] = y
						if lottmapgen.biome[biome].surface then
							lottmapgen.biome[biome].surface(data, vi, y)
							if grassp2 then
								p2data[vi] = grassp2
							end
						end
						if lottmapgen.biome[biome].deco then
							vi = area:index(x, y + 1, z)
							lottmapgen.biome[biome].deco(data, p2data, vi, area,
								x, y + 1, z, noise_1, nvals_x[nixz], schems)
						end
					end
				elseif y < stone_depth then
					data[vi] = c_stone
					if not heightmap[nixz] then
						heightmap[nixz] = y
					end
					if biome and lottmapgen.biome[biome] then
						if lottmapgen.biome[biome].soil_depth and
							y >= stone_depth - lottmapgen.biome[biome].soil_depth -
							math.abs(nvals_ter[nixz] * 5) and y >= -1 then
							if lottmapgen.biome[biome].soilf then
								lottmapgen.biome[biome].soilf(data, vi, y)
							elseif lottmapgen.biome[biome].soil then
								data[vi] = lottmapgen.biome[biome].soil
							end
						elseif lottmapgen.biome[biome].stone_depth and
							y >= -lottmapgen.biome[biome].stone_depth - nvals_ter[nixz] * 10 then
							if lottmapgen.biome[biome].stone_depth and lottmapgen.biome[biome].stone then
								data[vi] = lottmapgen.biome[biome].stone
							end
						end
					end
				elseif y <= 0 then
					if y == stone_depth then
						data[vi] = c_stone
						if biome and lottmapgen.biome[biome] then
							if lottmapgen.biome[biome].beach then
								data[vi] = lottmapgen.biome[biome].beach
							end
						end
					else
						data[vi] = c_water
						if biome and lottmapgen.biome[biome] then
							if lottmapgen.biome[biome].water then
								data[vi] = lottmapgen.biome[biome].water
							end
							if y == 0 and lottmapgen.biome[biome].water_surface then
								vi = area:index(x, y + 1, z)
								lottmapgen.biome[biome].water_surface(data, p2data, vi, area,
									x, y + 1, z, noise_1)
							end
						end
					end
				end
			end
		nixz = nixz + 1
		end
	end
	vm:set_data(data)
	vm:set_param2_data(p2data)
	for _, tab in pairs(schems) do
		minetest.place_schematic_on_vmanip(vm, tab[2],
			modpath .. "/schems/" .. tab[1], "random",
			{air = "ignore"})
	end
	minetest.generate_ores(vm, minp, maxp)
	vm:set_lighting({day=0, night=0})
	vm:calc_lighting()
	vm:update_liquids()
	vm:write_to_map(data)
	local chugent = math.ceil((os.clock() - t1) * 1000)
	--print(chugent)
	table.insert(times, chugent)
end)

minetest.register_on_shutdown(function()
	local t = 0
	for i,v in pairs(times) do
		t = t + v
	end
	t = t / #times
	print("Number of chunks: " .. #times .. "    Average Mapgen Time per chunk: " .. t)
end)