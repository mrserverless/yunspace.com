---
author: yunspace
comments: true
date: '2016-12-31T12:42:00+11:00'
share: true
tags:
  - unity3d
  - jetbrain-rider
  - gamedev
title: "Unity3d C# 5.0, 6.0 and 7.0 integration with Jetbrains Rider"
slug: "unity3d-csharp-5-6-7-integration-with-jetbrains-rider"
---

Last year I wrote about [Integrating Visual Studio with Unity3d on Mac using UnityVS Tools][unity3d-vstools]. However the solution was still not ideal for me due to:

- Maintaining a VM on a Mac purely for Visual Studio is quite overkill.
- Being experienced with IntelliJ, I found VS less familiar even with ReSharper.

[Unity Dev with Visual Studio Code][vscode] is alot more light weight, cross-platform and well documented. Perfect for VS users. 
But in the end I personally still prefer Jetbrain keymap to avoid context switching. Since I do all my backend code (Golang, Node, Serverless) using IntelliJ.   

I tried [Consulo][consulo] but it was a bit of a hit and miss, and not really a production ready product. 

Then there is [Jetbrains Rider][rider], which has added a lot more Unity support feautures recently and is looking quite promising. 

![Unity3d C# 5.0, 6.0 and 7.0 integration with Jetbrains Rider](/images/unity3d/unity3d-csharp-5-6-7-integration-with-jetbrains-rider.png)

There are a number of plugins and unlike [VSCode][vscode], there isn't a nice consolidated instruction document. So here are steps I took for those interested to do the same:

1. Download and install the latest [Jetbrain Rider][rider]
2. Install [ReSharper for Unity][resharper] during the Rider installation process, or from the Plugins menu afterwards.
3. Install [Unity3dRider][unity3drider] into your Unity3d project

To leverage the latest improvements in C# 5.0, 6.0 or 7.0:

4. Install `CSharp60Support` or `CSharp70Support` via [unity-c-5.0-and-6.0-integration][alexzzzz] plugin
5. Reimport all assets. Unity3dRider is compatible with `CSharp60Support` and `CSharp70Support`

Fellow Jetbrains users now have access to the same IDE across all platforms, with the same familiar keymap and support for the latest C# versions. 
It's really quite awesome. Enjoy!

[unity3d-vstools]:  /post/integrating-visual-studio-with-unity3d-on-mac-using-unityvs-tools
[vscode]:           https://code.visualstudio.com/Docs/runtimes/unity
[consulo]:          https://github.com/consulo
[rider]:            https://www.jetbrains.com/rider/
[resharper]:        https://github.com/JetBrains/resharper-unity
[unity3drider]:     https://github.com/JetBrains/Unity3dRider
[alexzzzz]:         https://bitbucket.org/alexzzzz/unity-c-5.0-and-6.0-integration/src