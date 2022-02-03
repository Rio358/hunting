# hunting Activity

[REQUIREMENTS]
  
* ESX Legacy, ymmv
* [PolyZone](https://github.com/mkafrin/PolyZone)
* [Qtarget](https://github.com/overextended/qtarget)
* mythic_notify or a notification script of your choice. ``Don't currently have a recent link to this one, but it does exist!``
* mythic_progbar ``Don't currently have a recent link to this one either, but it does exist!``
* There is included a second client/main.lua file if the first one is not functioning for your version of ESX as the way it handles GetClosestPed changes from version to version.


# Inspired by qalle-esx-hunting used as reference in creation.
# Contributed to by [thelindat](https://github.com/thelindat), [DRKM43](https://github.com/drkm43), [Noms Sadge](https://github.com/OfficialNoms) ``network code and ped spawner respectively``

# No Promises if it will function for previous version of ESX with the nature of the natives called, if it does, poggers, if not, I'm sure someone'll figure it out.
You are free to edit whatever it is that might tickle your fancy, just don't try to profit off of it or anything dickish like that.

[INSTALLATION]

1) Download/copy files/open in desktop etc.

2) Add to your server.cfg :
``ensure PolyZone``

``ensure qtarget``
``ensure hunting``

3) Import tiny SQL file, perhaps find pictures for your inventory hud etc.
``import items.sql``


4) If your mythic_notify does not have a `SendAlert` export, you can replace this with any other event you might have or add it. I will attach some snippets inside of the config file.



# Ill advised but i started one of these things : [Ko-Fi Link](https://ko-fi.com/rio358)
