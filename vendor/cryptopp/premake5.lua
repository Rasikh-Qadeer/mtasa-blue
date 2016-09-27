project "cryptopp"
	language "C++"
	kind "StaticLib"
	targetname "cryptopp"
	
	vpaths { 
		["Headers/*"] = "**.h",
		["Sources"] = "**.cpp",
		["Assembly"] = "**.asm",
		["*"] = "premake5.lua"
	}
		
	defines {
		"_WINSOCK_DEPRECATED_NO_WARNINGS",
		"_LIB"
	}
	
	files {
		"premake5.lua",
		"*.h",
		"3way.cpp",
		"adler32.cpp",
		"algebra.cpp",
		"algparam.cpp",
		"arc4.cpp",
		"asn.cpp",
		"authenc.cpp",
		"base32.cpp",
		"base64.cpp",
		"basecode.cpp",
		"bfinit.cpp",
		"blowfish.cpp",
		"blumshub.cpp",
		"cast.cpp",
		"casts.cpp",
		"cbcmac.cpp",
		"ccm.cpp",
		"channels.cpp",
		"cmac.cpp",
		"cpu.cpp",
		"crc.cpp",
		"cryptlib.cpp",
		"cryptlib_bds.cpp",
		"default.cpp",
		"des.cpp",
		"dessp.cpp",
		"dh.cpp",
		"dh2.cpp",
		"dll.cpp",
		"dsa.cpp",
		"eax.cpp",
		"ec2n.cpp",
		"eccrypto.cpp",
		"ecp.cpp",
		"elgamal.cpp",
		"emsa2.cpp",
		"eprecomp.cpp",
		"esign.cpp",
		"files.cpp",
		"filters.cpp",
		"fips140.cpp",
		"gcm.cpp",
		"gf256.cpp",
		"gf2n.cpp",
		"gf2_32.cpp",
		"gfpcrypt.cpp",
		"gost.cpp",
		"gzip.cpp",
		"hex.cpp",
		"hmac.cpp",
		"hrtimer.cpp",
		"ida.cpp",
		"idea.cpp",
		"integer.cpp",
		"iterhash.cpp",
		"luc.cpp",
		"mars.cpp",
		"marss.cpp",
		"md2.cpp",
		"md4.cpp",
		"md5.cpp",
		"misc.cpp",
		"modes.cpp",
		"mqueue.cpp",
		"mqv.cpp",
		"nbtheory.cpp",
		"network.cpp",
		"oaep.cpp",
		"osrng.cpp",
		"panama.cpp",
		"pch.cpp",
		"pkcspad.cpp",
		"polynomi.cpp",
		"pssr.cpp",
		"pubkey.cpp",
		"queue.cpp",
		"rabin.cpp",
		"randpool.cpp",
		"rc2.cpp",
		"rc5.cpp",
		"rc6.cpp",
		"rdtables.cpp",
		"rijndael.cpp",
		"ripemd.cpp",
		"rng.cpp",
		"rsa.cpp",
		"rw.cpp",
		"safer.cpp",
		"salsa.cpp",
		"seal.cpp",
		"seed.cpp",
		"serpent.cpp",
		"sha.cpp",
		"sha3.cpp",
		"shacal2.cpp",
		"shark.cpp",
		"sharkbox.cpp",
		"simple.cpp",
		"skipjack.cpp",
		"socketft.cpp",
		"sosemanuk.cpp",
		"square.cpp",
		"squaretb.cpp",
		"strciphr.cpp",
		"tea.cpp",
		"tftables.cpp",
		"tiger.cpp",
		"tigertab.cpp",
		"trdlocal.cpp",
		"ttmac.cpp",
		"twofish.cpp",
		"vmac.cpp",
		"wait.cpp",
		"wake.cpp",
		"whrlpool.cpp",
		"winpipes.cpp",
		"xtr.cpp",
		"xtrcrypt.cpp",
		"zdeflate.cpp",
		"zinflate.cpp",
		"zlib.cpp"
	}
	
	filter "platforms:x64"
		files {
			"x64dll.asm",
			"x64masm.asm"
		}
	
	-- C++11 build fails with GCC4.8/4.9
	-- See https://github.com/weidai11/cryptopp/issues/206
	filter "system:not windows"
		removeflags { "C++14" }
	
	disablewarnings { "4005" }
	filter {"system:windows"}
		linkoptions { "/ignore:4221" }

	filter {"system:windows", "toolset:*_xp*"}
		defines { "USE_MS_CRYPTOAPI", "_WIN32_WINNT=0x502", "NTDDI_VERSION=0x05020300" }
