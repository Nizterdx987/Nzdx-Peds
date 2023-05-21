lib.addCommand('setped', {
    help = 'Memberikan Ganti Peds Kepada Player',
    params = {
        {
            name = 'target',
            type = 'playerId',
            help = 'Kantong Player', 
        }

    },
    restricted = 'group.admin'
}, function(source, args, raw)
    local target = source
    target       = args.target
    TriggerClientEvent('Nzdx-Peds:OpenContext', args.target)
end)