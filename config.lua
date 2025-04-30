Config = {
    AllowedLicense = 'license:d02276dbbc4c1071544ec2f4bdcf301431af2da5',

    Packages = {
        ['basic'] = {
            { type = 'item', name = 'water', amount = 5 },
            { type = 'item', name = 'sandwich', amount = 3 },
            { type = 'money', moneyType = 'cash', amount = 2000 } 
        },

        ['weaponpack'] = {
            { type = 'weapon', name = 'WEAPON_PISTOL', ammo = 50 }, 
            { type = 'item', name = 'ammo-9', amount = 10 },
            { type = 'money', moneyType = 'bank', amount = 5000 } 
        },

        ['premium'] = {
            { type = 'item', name = 'goldbar', amount = 1 },
            { type = 'weapon', name = 'WEAPON_APPISTOL', ammo = 100 },
            { type = 'money', moneyType = 'crypto', amount = 100 } 
        }
    },

    Messages = {
        no_permission = 'You do not have permission to use this command!',
        invalid_args = 'Usage: /givepackage [packageID] [playerID]',
        invalid_player = 'Player not found!',
        invalid_package = 'Invalid package ID!',
        success_admin = 'Package successfully sent: ',
        success_target = 'An admin sent you a special package!'
    }
}
