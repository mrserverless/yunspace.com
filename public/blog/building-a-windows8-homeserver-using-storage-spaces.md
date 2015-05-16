For a while now I've been trying to decide whether to buy a NAS or build my own. I wanted some basic RAID setup to protect my data and photos but can't quite justify paying
$250-$500 for a 2 bay diskless NAS enclosure. In the end I decided to pull out my old PC, to build a home server using some extra disks pooled together by [Windows8 Storage Space](http://windows.microsoft.com/en-AU/windows-8/storage-spaces-pools).
![homeserver running](/img/homeserver/homeserver_running.png)

I started out with the following options:

**Buy a NAS**

*Pros*
  - Does one thing and does one thing well.
  - Easy to use and setup

*Cons*
  - Software are not open standards and you are stuck with the vendor OS
  - Limited Plug In such as Plex may be limited by the amount of RAM in the NAS

**Build my own NAS**

*Pros*
  - Use opensource software such as Amahi or FreeNas.
  - More flexibility in plugins

*Cons*
  - Lots of work to setup and another OS to learn.
  - Not so friendly for non-techy family members

**Home Server**

*Pros*
  - Re-use my old PC
  - Everyone knows how to use Windows. Works as a file server, home office pc and game machine

*Cons*
  - Some work involved, but manageable.
  - Noisy and power hungry, but can be mitigated.

After deciding on buliding my own Home Server, the following lifehacker articles got me started:
- [Do you run a Home Server or NAS](http://lifehacker.com/5974253/do-you-run-a-home-server-or-nas)
- [Building a Low Powered Home File Server](http://lifehacker.com/5938883/how-can-i-build-a-quiet-low+powered-home-file-server)

## Parts
[Build the Perfect Media Centre for $600](http://www.lifehacker.com.au/2014/02/build-the-perfect-media-centre-for-600/) - very useful guide for budgeting your spending.

*Existing:*
- Old 2006 PC with Asus motherboard and 2GB DDR2 RAM - not much RAM but my GFX card has more integrated RAM.
- [AMD Radeon HD7950](http://www.powercolor.com/au/products_features.asp?id=418) - bought this in 2013 for gaming and mining litecoins (such stupid idea). Can't remember the price
- [Corsair VS650](http://www.corsair.com/en/vs-seriestm-vs650-650-watt-power-supply) - had to upgrade the power for the GFX card. Can't remember the price.

*Bought:*
- 2 x [WD Red 2 TB Nas Drives](http://www.wdc.com/en/products/products.aspx?id=810) for $278 on mwave
- 2 x 4GB DDR3 RAM for $90 on mwave (doesn't fit my motherboard, so not useful unless I further upgrade my machine)
![parts](/img/homeserver/parts.png)

## OS and RAID
Windows 8.1 Enterprise - I read [Use Windows 8 as a Windows Home Server](http://lifehacker.com/5955262/use-windows-8-as-a-windows-home-server) but it
 was pretty useless and the article they linked is trying to sell a ebook. But who needs to read a ebook to use Windows anyway?

I use software based RAID 1 provided by [Windows8 Storage Space](http://windows.microsoft.com/en-AU/windows-8/storage-spaces-pools). The pool consists of my two new
WD Red 2TB formatted in RESF format. The storage pool is then network shared.
![storage spaces](/img/homeserver/storage-space.png)

## Sync
*Files* - [BT Sync](https://www.getsync.com/)

*Photos* - Don't have a good solution yet, espeically for iPhone. BT Sync kinda works but not very good for Photo organisation or browsing. Any suggestions let me know.

## Backup
*Time Machine* - Use Sparse Image Bundle according to this article from [Make Use Of](http://www.makeuseof.com/tag/turn-nas-windows-share-time-machine-backup/)

*iTunes* - Create symbolic links in my ITunes library pointing to my networked drive. See [instructions](http://www.imore.com/how-move-your-iphone-and-ipad-backups-external-drive)

## Remote Access
Chrome Remote Desktop for remote login

Steam Stream for gaming (optional)

In conclusion, my total cost was really just the disks. Ignoring my overkill GFX card and 650V power supply, you should be able to do a similar setup to turn any old PC into a
RAID enabled home server. As long as it supports SATA drives and can run Windows 8.

In the future I will look to also upgrade the motherboard, CPU and Case. Again being budget conscious I'll go for the Micro ATX board and cases less than $100 each. But for now
 this home server/game machine combination is doing well.
