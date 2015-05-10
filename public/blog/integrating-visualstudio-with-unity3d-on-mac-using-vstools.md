I had the pleasure of attending the first ever [Unite Australia](http://unity3d.com/unite/australia) conference in Melbourne
back in Octorber 2014. Was given some minor discount vouchers which I used to pre-purchase a license for the upcoming [Unity5](http://unity3d.com/5) release. With plenty of ram to spare on my Macbook Pro (16GB), I thought it would be a good exercise to to run a virtualised Visual Studio to compliment Unity Editor on OSX. [Unity3d Visual Studio Tools](/img/unity3d-visualstudio-on-mac-using-vstools.png)

There has been many different approaches to this problem. Some are out dated and some are quite complex involving custom hacks. But I think the easiest way is using the offical [Visual Studio Tools for Unity](http://unityvs.com/):

## Parallels Desktop

 1. Have a windows VM. For this example, I'm using Windows 8.1 Ultimate.
 2. Install Visual Studio in your Windows VM. I'm using [Visual Studio 2015 Preview](http://www.visualstudio.com/en-us/news/vs2015-vs.aspx) in this example.
 2. Enable coherence so you can access Visual Studio from your Mac Finder via Application Folder. E.g. my windows applications can be found in:

     /Users/{user}/Applications/Windows 8.1 Applications/

 3. Map your Unity project folder to a location that is accessible by your VM, or put your Unity projects inside a folder that is already mapped to your VM, such as you Documents folder.

## Visual Studio

 1. Open Visual Studio, download and install Syntax Tree's [VS Tools for Unity](http://unityvs.com/) tool. Choose the correct version for your Visual Studio. Follow the instructions on their wiki page.
 2. Verify that after installation, the following Unity3d asset is placed in your Windows VM

    C:\Standard Packages\Visual Studio 2015 Tools.unity3d

## Unity Editor

 1. Open Unity3d editor. Import the Visual Studio 2015 Tools asset.
 2. If the import succeeds, you should see a new `Visual Studio Tools` menu item appear and also the following project files:

    UnityVS/Editor/SyntaxTree.VisualStudio.Unity.Bridge.dll
    UnityVS/Editor/SyntaxTree.VisualStudio.Unity.Messaging.dll

 3. If the `UnityVS/Editor` folders are empty, try manually extracting out the dll files using [UnityPackage Unpacker](https://github.com/derFunk/UPU) and importing them again.
 4. Go to `Unity Preferences` -> `External Toosl` and set External Script Editor by browsing to the Visual Studio application available in:

    /Users/{user}/Applications/Windows 8.1 Applications/

    Now, you should be able double click and open all scripts inside Visual Studio.



 5. Go to `Visutal Studio Tools` menu item and select `Generate Project Files`. The following files should be generated:

 	UnityVS.{project}.sln
 	UnityVS.{project}.CSharp.sln
 	UnityVS.{project}.CSharp.Editor.sln
 	UnityVS.{project}.CSharp.Plugins.sln

 6. Unfortunately the menu item `Open in Visual Studio` button doesn't work. You can work around this by using Finder: right click on the UnityVS solution file and select open with Visual Studio. Do not use the MonoDevelop generated solution/project files anymore.

 7. Inside your Windows VM, with your Unity project open in Visual Studio , verify you use `Attach to Unity` to debug your running Mac Unity instance.

Hopefully now you will have the best of both worlds.
