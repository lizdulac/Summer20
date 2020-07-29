local target = terralib.newtarget {
    --Triple = "x86_64-pc-linux"; -- This compiles
    Triple = "spir64-unknown-unknown"; -- Does not
}

terra add()
    -- Add... or something
end

terralib.saveobj("terra_kernel.spv", {add=add}, {}, target)
