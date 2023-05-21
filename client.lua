function NzdxGantiModel(model)
    SetEntityInvincible(cache.ped,true)
    if IsModelInCdimage(model) and IsModelValid(model) then
        lib.requestModel(model)
        SetPlayerModel(PlayerId(), model)
        SetModelAsNoLongerNeeded(model)
        FreezePedCameraRotation(cache.ped, true)
        SetPedDefaultComponentVariation(cache.ped)
        if model ~= nil and (model == `mp_f_freemode_01` or model == `mp_m_freemode_01`) then
            SetPedHeadBlendData(cache.ped, 0, 0, 0, 15, 0, 0, 0, 1.0, 0, false)
            SetPedComponentVariation(cache.ped, 11, 0, 1, 0)
            SetPedComponentVariation(cache.ped, 8, 0, 1, 0)
            SetPedComponentVariation(cache.ped, 6, 1, 2, 0)
            SetPedHeadOverlayColor(cache.ped, 1, 1, 0, 0)
            SetPedHeadOverlayColor(cache.ped, 2, 1, 0, 0)
            SetPedHeadOverlayColor(cache.ped, 4, 2, 0, 0)
            SetPedHeadOverlayColor(cache.ped, 5, 2, 0, 0)
            SetPedHeadOverlayColor(cache.ped, 8, 2, 0, 0)
            SetPedHeadOverlayColor(cache.ped, 10, 1, 0, 0)
            SetPedHeadOverlay(cache.ped, 1, 0, 0.0)
            SetPedHairColor(cache.ped, 1, 1)
        end
    end
    SetEntityInvincible(cache.ped, false)
    SetEntityHealth(cache.ped, 200)
end

RegisterNetEvent('Nzdx-Peds:OpenContext', function()
    lib.registerContext({
        id      = 'nzdx:openmenu',
        title   = 'UI Menu',
        options = {
          {
            title       = 'Menu List Peds',
            event       = 'Nzdx-Peds:PilihanUI',
            args        = {
              Pilihan   = 'MenuA'
            }
          },
          {
            title       = 'Menu Input Dialog',
            event       = 'Nzdx-Peds:PilihanUI',
            args        = {
              Pilihan   = 'MenuB'
            }
          },
        }
      })

      lib.showContext('nzdx:openmenu')
end)

RegisterNetEvent('Nzdx-Peds:PilihanUI', function(data)
    if data.Pilihan == 'MenuA' then
        local options = {}
        for i = 1, #Nzdx.ListPeds do
          for k, v in pairs(Nzdx.ListPeds) do
            options[k] = {value = v, label = ('%s'):format(v)}
          end
        end

        local input = lib.inputDialog('Nzdx-Peds', {
            { type = 'select', label = 'Pilih Peds', options = options}
        })
    
        if not input then return end

        NzdxGantiModel(joaat(input[1]))
        lib.notify({
            title       = 'Nzdx-Peds',
            description = 'Anda Berhasil Mengganti Peds',
            type        = 'success'
        })

    elseif data.Pilihan == 'MenuB' then
        local input = lib.inputDialog('Nzdx-Peds', {'Nama Peds'})
    
        if not input then return end
        
        NzdxGantiModel(joaat(input[1]))
        lib.notify({
            title       = 'Nzdx-Peds',
            description = 'Anda Berhasil Mengganti Peds',
            type        = 'success'
        })
    end
end)