#tag Window
Begin Window wndInstallSceneryPackage
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   True
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   814
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   793
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   750
   MinimizeButton  =   True
   MinWidth        =   793
   Placement       =   0
   Resizeable      =   True
   Title           =   "#kWindowTitle"
   Visible         =   True
   Width           =   793
   Begin HTTPSocket sockLogin
      Address         =   ""
      BytesAvailable  =   0
      BytesLeftToSend =   0
      Handle          =   0
      httpProxyAddress=   ""
      httpProxyPort   =   0
      Index           =   -2147483648
      InitialParent   =   ""
      IsConnected     =   False
      LastErrorCode   =   0
      LocalAddress    =   ""
      LockedInPosition=   False
      Port            =   80
      RemoteAddress   =   ""
      Scope           =   0
      TabPanelIndex   =   0
      yield           =   False
   End
   Begin TabPanel tabMain
      AutoDeactivate  =   True
      Bold            =   False
      Enabled         =   True
      Height          =   717
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Panels          =   ""
      Scope           =   0
      SmallTabs       =   False
      TabDefinition   =   "#kOnlineTextSearch\r#kOnlineLocationSearch\r#kLocalZipInstall"
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   True
      Value           =   0
      Visible         =   True
      Width           =   753
      Begin TextField txtSearchTerm
         AcceptTabs      =   False
         Alignment       =   0
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "tabMain"
         Italic          =   False
         Left            =   167
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Mask            =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   151
         Transparent     =   True
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   590
      End
      Begin Label StaticText11
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "tabMain"
         Italic          =   False
         Left            =   50
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   8
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "#kResults"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   184
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   100
      End
      Begin Label Label1
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   53
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "tabMain"
         Italic          =   False
         Left            =   37
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   True
         Scope           =   0
         Selectable      =   False
         TabIndex        =   1
         TabPanelIndex   =   3
         TabStop         =   True
         Text            =   "#kInstallFromLocalZip"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   58
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   726
      End
      Begin Rectangle Rectangle1
         AutoDeactivate  =   True
         BorderWidth     =   1
         BottomRightColor=   &cBBBBBB00
         Enabled         =   True
         FillColor       =   &cCCCCCC00
         Height          =   573
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "tabMain"
         Left            =   37
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   3
         Top             =   107
         TopLeftColor    =   &cBBBBBB00
         Transparent     =   True
         Visible         =   True
         Width           =   720
         Begin Label Label2
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   False
            Height          =   61
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "Rectangle1"
            Italic          =   False
            Left            =   37
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   False
            TabIndex        =   0
            TabPanelIndex   =   3
            TabStop         =   True
            Text            =   "#kDropZipFileHere"
            TextAlign       =   1
            TextColor       =   &cAAAAAA00
            TextFont        =   "System"
            TextSize        =   30.0
            TextUnit        =   0
            Top             =   370
            Transparent     =   True
            Underline       =   False
            Visible         =   True
            Width           =   720
         End
      End
      Begin Listbox lstTextResults
         AutoDeactivate  =   True
         AutoHideScrollbars=   True
         Bold            =   False
         Border          =   True
         ColumnCount     =   3
         ColumnsResizable=   False
         ColumnWidths    =   "60%,25%"
         DataField       =   ""
         DataSource      =   ""
         DefaultRowHeight=   -1
         Enabled         =   True
         EnableDrag      =   False
         EnableDragReorder=   False
         GridLinesHorizontal=   0
         GridLinesVertical=   0
         HasHeading      =   True
         HeadingIndex    =   -1
         Height          =   174
         HelpTag         =   ""
         Hierarchical    =   False
         Index           =   -2147483648
         InitialParent   =   "tabMain"
         InitialValue    =   "#kTitle	#kAirports	#kFileSize"
         Italic          =   False
         Left            =   167
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         RequiresSelection=   False
         Scope           =   0
         ScrollbarHorizontal=   False
         ScrollBarVertical=   True
         SelectionType   =   0
         ShowDropIndicator=   False
         TabIndex        =   9
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   11.0
         TextUnit        =   0
         Top             =   184
         Transparent     =   True
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   590
         _ScrollOffset   =   0
         _ScrollWidth    =   -1
      End
      Begin Label Label3
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   88
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "tabMain"
         Italic          =   False
         Left            =   37
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   True
         Scope           =   0
         Selectable      =   False
         TabIndex        =   10
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "#kInstallFromOnlineTextSearch"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   58
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   507
      End
      Begin Canvas Canvas2
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   1975463092
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   67
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "tabMain"
         Left            =   556
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   2
         TabStop         =   True
         Top             =   58
         Transparent     =   True
         UseFocusRing    =   False
         Visible         =   True
         Width           =   201
      End
      Begin Label Label4
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   83
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "tabMain"
         Italic          =   False
         Left            =   37
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   True
         Scope           =   0
         Selectable      =   False
         TabIndex        =   1
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "#kInstallFromOnlineLocationSearch"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   58
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   507
      End
      Begin Canvas cnvMap
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   False
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   False
         Height          =   360
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "tabMain"
         Left            =   37
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   2
         TabStop         =   True
         Top             =   187
         Transparent     =   True
         UseFocusRing    =   False
         Visible         =   True
         Width           =   720
      End
      Begin Label StaticText12
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "tabMain"
         Italic          =   False
         Left            =   33
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   3
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "#kSearchRadius"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   152
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   117
      End
      Begin Label StaticText111
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "tabMain"
         Italic          =   False
         Left            =   33
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   5
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "#kResults"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   557
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   117
      End
      Begin PopupMenu popSearchRadius
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "tabMain"
         InitialValue    =   "100 NM\r250 NM\r500 NM\r1000 NM"
         Italic          =   False
         Left            =   167
         ListIndex       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   6
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   151
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   122
      End
      Begin Canvas Canvas3
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   1975463092
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   67
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "tabMain"
         Left            =   556
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   11
         TabPanelIndex   =   1
         TabStop         =   True
         Top             =   58
         Transparent     =   True
         UseFocusRing    =   False
         Visible         =   True
         Width           =   201
      End
      Begin HTMLViewer htmlDescription
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   310
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "tabMain"
         Left            =   167
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   False
         Renderer        =   0
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         Top             =   370
         Visible         =   True
         Width           =   590
      End
      Begin Label StaticText1
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "tabMain"
         Italic          =   False
         Left            =   50
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   12
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "#kSearch"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   152
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   100
      End
      Begin PushButton btnDownloadAndInstall
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "#App.kDownloadAndInstall"
         Default         =   False
         Enabled         =   False
         Height          =   27
         HelpTag         =   "#kHTInstall"
         Index           =   -2147483648
         InitialParent   =   "tabMain"
         Italic          =   False
         Left            =   586
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   False
         Scope           =   0
         TabIndex        =   13
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   692
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   171
      End
      Begin Listbox lstLocationResults
         AutoDeactivate  =   True
         AutoHideScrollbars=   True
         Bold            =   False
         Border          =   True
         ColumnCount     =   3
         ColumnsResizable=   False
         ColumnWidths    =   "60%,25%"
         DataField       =   ""
         DataSource      =   ""
         DefaultRowHeight=   -1
         Enabled         =   True
         EnableDrag      =   False
         EnableDragReorder=   False
         GridLinesHorizontal=   0
         GridLinesVertical=   0
         HasHeading      =   True
         HeadingIndex    =   -1
         Height          =   123
         HelpTag         =   ""
         Hierarchical    =   False
         Index           =   -2147483648
         InitialParent   =   "tabMain"
         InitialValue    =   "#kTitle	#kAirports	#kFileSize"
         Italic          =   False
         Left            =   167
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         RequiresSelection=   False
         Scope           =   0
         ScrollbarHorizontal=   False
         ScrollBarVertical=   True
         SelectionType   =   0
         ShowDropIndicator=   False
         TabIndex        =   7
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   11.0
         TextUnit        =   0
         Top             =   557
         Transparent     =   True
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   590
         _ScrollOffset   =   0
         _ScrollWidth    =   -1
      End
      Begin PushButton btnDownloadAndInstall1
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "#App.kDownloadAndInstall"
         Default         =   False
         Enabled         =   False
         Height          =   27
         HelpTag         =   "#kHTInstall"
         Index           =   -2147483648
         InitialParent   =   "tabMain"
         Italic          =   False
         Left            =   586
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   False
         Scope           =   0
         TabIndex        =   9
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   692
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   171
      End
      Begin PushButton btnBrowseForZip
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "#kBrowseForZipFile"
         Default         =   False
         Enabled         =   True
         Height          =   27
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "tabMain"
         Italic          =   False
         Left            =   586
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   False
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   692
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   171
      End
   End
   Begin HTTPSocket sockManifest
      Address         =   ""
      BytesAvailable  =   0
      BytesLeftToSend =   0
      Handle          =   0
      httpProxyAddress=   ""
      httpProxyPort   =   0
      Index           =   -2147483648
      InitialParent   =   ""
      IsConnected     =   False
      LastErrorCode   =   0
      LocalAddress    =   ""
      LockedInPosition=   False
      Port            =   80
      RemoteAddress   =   ""
      Scope           =   0
      TabPanelIndex   =   0
      yield           =   False
   End
   Begin HTTPSocket sockFile
      Address         =   ""
      BytesAvailable  =   0
      BytesLeftToSend =   0
      Handle          =   0
      httpProxyAddress=   ""
      httpProxyPort   =   0
      Index           =   -2147483648
      InitialParent   =   ""
      IsConnected     =   False
      LastErrorCode   =   0
      LocalAddress    =   ""
      LockedInPosition=   False
      Port            =   80
      RemoteAddress   =   ""
      Scope           =   0
      TabPanelIndex   =   0
      yield           =   False
   End
   Begin ProgressBar prgDownload
      AutoDeactivate  =   True
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Maximum         =   100
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      Top             =   774
      Transparent     =   True
      Value           =   0
      Visible         =   False
      Width           =   753
   End
   Begin Label lblProgress
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   18
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   11.0
      TextUnit        =   0
      Top             =   744
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   753
   End
   Begin UnzipThread thrUnzip
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Priority        =   5
      Scope           =   0
      StackSize       =   0
      TabPanelIndex   =   0
   End
   Begin Timer tmrUnzipMonitor
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Mode            =   0
      Period          =   100
      Scope           =   0
      TabPanelIndex   =   0
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  sockManifest.close
		  sockLogin.close
		  sockFile.close
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  // Check package list, will download a new one if it's out of date
		  checkAndUpdatePackageList()
		  
		  // Set up map
		  pMap = new Picture(imgWorldmap.width / App.kMapZoomFactor, imgWorldmap.height / App.kMapZoomFactor, 32)
		  dim g as Graphics = pMap.graphics
		  g.drawPicture(imgWorldmap, 0, 0, g.width, g.height, 0, 0, imgWorldmap.width, imgWorldmap.height)
		  
		  // The username needs to come out of preferences if available, instead of the login window
		  pOrgUsername = wndLogin.txtUsername.text
		  pOrgPassword = wndLogin.txtPassword.text
		  
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function FileClose() As Boolean Handles FileClose.Action
			me.close
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Sub addSceneryPackageFromZip(optional folderItem as FolderItem = nil)
		  dim dialog as SelectFolderDialog
		  dim zipType As new FileType
		  
		  zipType.Name = "application/zip"
		  zipType.MacType = "ZIP "
		  zipType.Extensions = "zip"
		  
		  if (folderItem = nil) then
		    folderItem = getOpenFolderItem(zipType)
		    
		    if (folderItem = nil) then
		      return
		    end if
		  end if
		  
		  thrUnzip.init(folderItem)
		  thrUnzip.run()
		  tmrUnzipMonitor.mode = Timer.ModeMultiple
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub checkAndUpdatePackageList()
		  dim sql as String = "SELECT value FROM info WHERE key = '" + App.kDBInfoKeyLastDownload + "'"
		  dim rs as recordSet
		  
		  rs = dbMain.SQLSelect(sql)
		  
		  if (rs <> nil and rs.Field("value") <> nil and rs.Field("value").StringValue <> "") then
		    dim lastDownloadDate as new Date()
		    
		    lastDownloadDate.SQLDateTime = rs.Field("value")
		    
		    dim now as new Date()
		    
		    if (now.totalSeconds - lastDownloadDate.totalSeconds < 10) then
		      return
		    end if
		    
		    // We're about to re-download, clear any last download record
		    sql = "DELETE FROM info WHERE key = '" + App.kDBInfoKeyLastDownload + "'"
		    dbMain.SQLExecute(sql)
		  end if
		  
		  // If we've got here then we need to download the package list
		  prgDownload.value = 0
		  prgDownload.maximum = 100
		  prgDownload.visible = true
		  sockManifest.get(App.kURLTempManifest, getTemporaryFolderItem())
		  'sockManifest.get(App.kURLOrgManifest, getTemporaryFolderItem())
		  'parseManifest(SpecialFolder.Desktop.child("X-Plane").child("XAddonManager").child("doc").child("PackageList.xml"))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function compareByFileSize(value1 as String, value2 as String) As Integer
		  dim regex as new RegEx()
		  regex.SearchPattern = "([0-9]*.?[0-9]*)\s*([a-z]*)"
		  
		  dim col1Match as RegExMatch = regex.search(value1)
		  dim col2Match as RegExMatch = regex.search(value2)
		  
		  if (col1Match = nil) then return 1
		  if (col2Match = nil) then return -1
		  
		  dim col1SizeInBytes as double = val(col1Match.subExpressionString(1))
		  dim col2SizeInBytes as double = val(col2Match.subExpressionString(1))
		  
		  select case col1Match.subExpressionString(2)
		  case "kb"
		    col1SizeInBytes = col1SizeInBytes * 1024
		  case "mb"
		    col1SizeInBytes = col1SizeInBytes * 1048576
		  case "gb"
		    col1SizeInBytes = col1SizeInBytes * 1073741824
		  case "tb"
		    col1SizeInBytes = col1SizeInBytes * 1099511627776
		  end select
		  
		  select case col2Match.subExpressionString(2)
		  case "kb"
		    col2SizeInBytes = col2SizeInBytes * 1024
		  case "mb"
		    col2SizeInBytes = col2SizeInBytes * 1048576
		  case "gb"
		    col2SizeInBytes = col2SizeInBytes * 1073741824
		  case "tb"
		    col2SizeInBytes = col2SizeInBytes * 1099511627776
		  end select
		  
		  if (col1SizeInBytes > col2SizeInBytes) then return 1
		  if (col1SizeInBytes < col2SizeInBytes) then return -1
		  return 0
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub downloadPackage()
		  if (pOrgUsername = "" or pOrgPassword = "" or pCookies = "") then
		    logIn()
		  else
		    if lstTextResults.listIndex > -1 then
		      dim rs as RecordSet = getPackageRecord(lstTextResults.rowTag(lstTextResults.listIndex))
		      
		      if (rs <> nil) then
		        prgDownload.value = 0
		        prgDownload.maximum = 100
		        prgDownload.visible = true
		        
		        sockFile.SetRequestHeader("Cookie", pCookies)
		        sockFile.SetRequestHeader("User-Agent", App.kUserAgent)
		        sockFile.Get(rs.Field("download_url"), getTemporaryFolderItem())
		      end if
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub findNearestPackages(x as integer, y as integer)
		  dim i as integer
		  dim latitude as double = (90 * CustomSceneryPackage.kMapScaleFactor - y) / CustomSceneryPackage.kMapScaleFactor
		  dim longitude as double = (x - 180 * CustomSceneryPackage.kMapScaleFactor) / CustomSceneryPackage.kMapScaleFactor
		  
		  dim range as integer
		  select case popSearchRadius.listIndex
		  case 0
		    range = 100 / 60
		  case 1
		    range = 250 / 60
		  case 2
		    range = 500 / 60
		  case 3
		    range = 1000 / 60
		  end select
		  
		  dim airports() as Airport = App.pXPlaneFolder.pAirportData.findNearestAirports(latitude, longitude, range)
		  
		  dim airportCodes as String
		  for i = 0 to airports.ubound()
		    if (i > 0) then airportCodes = airportCodes + ","
		    airportCodes = airportCodes + "'" + escapeSQLData(airports(i).pCode) + "'"
		  next
		  
		  dim sql as String = "SELECT id, name, airport_codes, file_size FROM scenery_package WHERE airport_codes IN (" +airportCodes + ")"
		  dim rs as RecordSet = dbMain.SQLSelect(sql)
		  
		  lstLocationResults.deleteAllRows
		  
		  if (rs <> nil) then
		    populateListBoxFromRecordSet(lstLocationResults, rs, true)
		    lstLocationResults.scrollPosition = 0
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getPackageRecord(id as Integer) As RecordSet
		  dim sql as String
		  dim rs as recordSet = nil
		  
		  if (id > -1) then
		    sql = "SELECT * FROM scenery_package WHERE id = '" +str(id) + "'"
		    
		    rs = dbMain.SQLSelect(sql)
		  end if
		  
		  return rs
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub listPackages(searchText as String)
		  dim sql as String
		  dim rs as recordSet
		  
		  searchText = escapeSQLData(searchText)
		  
		  sql = "SELECT id, name, airport_codes, file_size FROM scenery_package WHERE name LIKE '%" +searchText + "%'"
		  sql = sql + " OR airport_codes LIKE '%" +searchText + "%'"
		  sql = sql + " OR description LIKE '%" + searchText + "%'"
		  
		  rs = dbMain.SQLSelect(sql)
		  
		  if (rs <> nil) then
		    populateListBoxFromRecordSet(lstTextResults, rs, true)
		    lstTextResults.scrollPosition = 0
		  else
		    btnDownloadAndInstall.enabled = false
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub logIn()
		  if (pOrgUsername = "" or pOrgPassword = "") then
		    wndLogin.show()
		  elseif (pCookies = "") then
		    wndLogin.hide()
		    
		    lblProgress.text = kProgressConnectingToServer
		    prgDownload.value = 0
		    prgDownload.maximum = 0
		    prgDownload.visible = true
		    
		    dim form as Dictionary = new Dictionary
		    form.value("ips_username") = pOrgUsername
		    form.value("ips_password") = pOrgPassword
		    
		    // The auth_key almost certainly needs to be parsed out of the page with the login form on it
		    form.value("auth_key") = "880ea6a14ea49e853634fbdc5015a024"
		    
		    // Set up the socket to POST the form
		    sockLogin.setFormData(form)
		    sockLogin.SetRequestHeader("User-Agent", App.kUserAgent)
		    sockLogin.post("http://forums.x-plane.org/index.php?app=core&module=global&section=login&do=process")
		  else
		    wndLogin.hide()
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub parseManifest(file as FolderItem)
		  dim now as Date = new Date()
		  dim sql as String = "INSERT INTO info (key, value) VALUES ('" + App.kDBInfoKeyLastDownload + "', '" + now.SQLDateTime + "')"
		  
		  dbMain.SQLExecute(sql)
		  
		  if dbMain.Error() then
		    MsgBox(dbMain.ErrorMessage())
		    return
		  end if
		  
		  dbMain.Commit()
		  
		  sql = "DELETE from scenery_package"
		  
		  dbMain.SQLExecute(sql)
		  
		  if dbMain.Error() then
		    MsgBox(dbMain.ErrorMessage())
		    return
		  end if
		  
		  dbMain.Commit()
		  
		  dim xdoc as XmlDocument
		  dim xmlNode as XMLNode
		  dim resultNodes as XMLNodeList
		  dim i as integer
		  dim id, name, creation_date, last_update_date, airport_codes, description, download_url, file_size as String
		  dim date as Date = new Date()
		  dim result as Boolean
		  
		  try
		    xdoc = new XmlDocument
		    xdoc.PreserveWhitespace = False
		    xdoc.loadXml(file)
		    
		    dim sceneryPackages as XMLNodeList = xdoc.XQL("//SceneryPackage")
		    
		    for i = 0 to sceneryPackages.Length - 1
		      xmlNode = sceneryPackages.Item(i)
		      sql = "INSERT INTO scenery_package (id, name, creation_date, last_updated_date, airport_codes, description, download_url, file_size) VALUES ("
		      
		      sql = sql + "'" + xmlNode.GetAttribute("id") + "',"
		      
		      resultNodes  = xmlNode.XQL("Name")
		      sql = sql + "'" + escapeSQLData(unencodeHTML(resultNodes.Item(0).FirstChild.value)) + "',"
		      
		      resultNodes  = xmlNode.XQL("CreationDate")
		      result = ParseDate(resultNodes.Item(0).FirstChild.value, date)
		      sql = sql + "'" + date.SQLDateTime + "',"
		      
		      resultNodes  = xmlNode.XQL("LastUpdateDate")
		      result = ParseDate(resultNodes.Item(0).FirstChild.value, date)
		      sql = sql + "'" + date.SQLDateTime + "',"
		      
		      resultNodes  = xmlNode.XQL("AirportCodes")
		      sql = sql + "'" + escapeSQLData(resultNodes.Item(0).FirstChild.value) + "',"
		      
		      resultNodes  = xmlNode.XQL("Description")
		      sql = sql + "'" + escapeSQLData(Utilities.convertBBtoHTML(resultNodes.Item(0).FirstChild.value)) + "',"
		      
		      resultNodes  = xmlNode.XQL("DownloadURL")
		      sql = sql + "'" + escapeSQLData(resultNodes.Item(0).FirstChild.value) + "',"
		      
		      resultNodes  = xmlNode.XQL("FileSize")
		      sql = sql + "'" + escapeSQLData(resultNodes.Item(0).FirstChild.value) + "'"
		      
		      sql = sql + ")"
		      
		      dbMain.SQLExecute(sql)
		      
		      if dbMain.Error() then
		        MsgBox(dbMain.ErrorMessage())
		        MsgBox(sql)
		        return
		      end if
		    next i
		    
		    if dbMain.Error() then
		      MsgBox(dbMain.ErrorMessage())
		      return
		    end if
		    
		    dbMain.Commit()
		    
		  catch ex as RuntimeException
		    dim parameters() as string = array(ex.Message)
		    lblProgress.text = App.processParameterizedString(kErrorParsingPackageList, parameters)
		  end try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub selectPackage(packageID as integer)
		  dim rs as RecordSet = getPackageRecord(packageID)
		  
		  if (rs <> nil) then
		    // Can't use getTemporaryFolderItem here because there's a bug in it where the file handle is left open on Linux.
		    // So instead we create our own randomly-named file inside the system temporary folder
		    dim r as Random = new Random
		    dim temporaryFile as FolderItem = SpecialFolder.Temporary.child(str(r.InRange(10000000, 99999999)))
		    dim tos as TextOutputStream = TextOutputStream.create(temporaryFile)
		    
		    tos.write("<html><head></head><body style='font-family:sans-serif;font-size:9pt;'>")
		    tos.write(Utilities.highlightSearchTerm(rs.field("description"), txtSearchTerm.text))
		    tos.write("</body></html>")
		    tos.close
		    
		    pInitialLoad = true
		    htmlDescription.loadPage(temporaryFile)
		  end if
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		pCookies As String
	#tag EndProperty

	#tag Property, Flags = &h0
		pInitialLoad As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		pMap As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		pOrgPassword As String
	#tag EndProperty

	#tag Property, Flags = &h0
		pOrgUsername As String
	#tag EndProperty


	#tag Constant, Name = kAirports, Type = String, Dynamic = True, Default = \"Airports", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kBrowseForZipFile, Type = String, Dynamic = True, Default = \"Browse for Zip File\xE2\x80\xA6", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kDropZipFileHere, Type = String, Dynamic = True, Default = \"Drop Zip File Here", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kErrorConnection, Type = String, Dynamic = True, Default = \"A connection error occurred: ${1}", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kErrorDownload, Type = String, Dynamic = True, Default = \"A download error occurred: ${1}", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kErrorLogin, Type = String, Dynamic = True, Default = \"An error occurred on login\x2C check your username and password", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kErrorNotValidCompressedSceneryPackage, Type = String, Dynamic = True, Default = \"You did not select a compressed scenery package.  Please try again.", Scope = Public
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"No heu seleccionat un paquet d\'escenari comprimit. Torneu-ho a provar."
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Non hai selezionato un archivio compresso dello scenario. Per favore riprova."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Vous n\'avez pas s\xC3\xA9lectionner une archive contenant une sc\xC3\xA8ne. Recommencez SVP."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Sie haben kein komprimiertes Scenery Packet ausgew\xC3\xA4hlt\x2C versuchen sie es bitte erneut."
		#Tag Instance, Platform = Any, Language = es, Definition  = \"No has seleccionado un paquete de escenario comprimido. Por favor\x2C intenta de nuevo."
	#tag EndConstant

	#tag Constant, Name = kErrorParsingPackageList, Type = String, Dynamic = True, Default = \"There was an error parsing the package list: ${1}", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFileSize, Type = String, Dynamic = True, Default = \"File Size", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kInstallFromLocalZip, Type = String, Dynamic = True, Default = \"Use this panel to install a scenery package from a zip file you have downloaded from the Internet.  Either click the \'Browse for Zip File\xE2\x80\xA6\' button to choose a file\x2C or drag the file into the area below.", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kInstallFromOnlineLocationSearch, Type = String, Dynamic = True, Default = \"Use this panel to install a scenery package from those available at X-Plane.org near a location on the map.  Click on the map to perform the search.  You can search and browse at your leisure\x2C but to download a package you must register on the site and log in inside XAddonManager.\r\rIf you don\'t already have an account\x2C click the X-Plane.org logo to register\x2C it\'s free!", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kInstallFromOnlineTextSearch, Type = String, Dynamic = True, Default = \"Use this panel to install a scenery package from those available at X-Plane.org by entering a search term.  You can search and browse at your leisure\x2C but to download a package you must register on the site and log in inside XAddonManager.\r\rIf you don\'t already have an account\x2C click the X-Plane.org logo to register\x2C it\'s free!", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kInstalling, Type = String, Dynamic = True, Default = \"Installing\xE2\x80\xA6", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kLastUpdated, Type = String, Dynamic = True, Default = \"Last Updated", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kLocalZipInstall, Type = String, Dynamic = True, Default = \"Local Zip Install", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kOnlineLocationSearch, Type = String, Dynamic = True, Default = \"Online Location Search", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kOnlineTextSearch, Type = String, Dynamic = True, Default = \"Online Text Search", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kProgressConnectingToServer, Type = String, Dynamic = True, Default = \"Connecting to server\xE2\x80\xA6", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kProgressDownloading, Type = String, Dynamic = True, Default = \"Downloading\xE2\x80\xA6", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kProgressDownloadingPackageList, Type = String, Dynamic = True, Default = \"Downloading package list\xE2\x80\xA6", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kResults, Type = String, Dynamic = True, Default = \"Results:", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kSearch, Type = String, Dynamic = True, Default = \"Search:", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kSearchRadius, Type = String, Dynamic = True, Default = \"Search Radius:", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kTitle, Type = String, Dynamic = True, Default = \"Title", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kUncompressingZip, Type = String, Dynamic = True, Default = \"Uncompressing zip file\xE2\x80\xA6", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kWindowTitle, Type = String, Dynamic = True, Default = \"Install Scenery Package", Scope = Public
	#tag EndConstant


#tag EndWindowCode

#tag Events sockLogin
	#tag Event
		Sub HeadersReceived(headers as internetHeaders, httpStatus as integer)
		  if (httpStatus = 302) then
		    // Successful login, store cookies
		    pCookies = headers.commaSeparatedValues("Set-cookie")
		  end if
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Error(code as integer)
		  dim parameters() as string = array(str(code))
		  lblProgress.text = App.processParameterizedString(kErrorConnection, parameters)
		  
		  pOrgUsername = ""
		  pOrgPassword = ""
		  
		  prgDownload.visible = false
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub PageReceived(url as string, httpStatus as integer, headers as internetHeaders, content as string)
		  pOrgUsername = ""
		  pOrgPassword = ""
		  
		  if (httpStatus = 200) then
		    // A 200 here means the redirect didn't happen, which is usually caused by incorrect login details
		    lblProgress.text = kErrorLogin
		  else
		    lblProgress.text = ""
		  end if
		  
		  'loginHTMLViewer.LoadPage(content, new FolderItem)
		  
		  prgDownload.visible = false
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events txtSearchTerm
	#tag Event
		Sub TextChange()
		  listPackages(me.text)
		  
		  // This stuff below searches the local apt.dat file to find the lat / long of an airport. Might be useful later…
		  
		  'if App.pXPlaneFolder.pAirportData.pAirports.hasKey(txtSearchTerm.text) then
		  'dim airport as Airport = App.pXPlaneFolder.pAirportData.pAirports.value(txtSearchTerm.text)
		  'txtLat.text = str(airport.pLatLong.pLatitude)
		  'txtLong.text = str(airport.pLatLong.pLongitude)
		  'else
		  'txtLat.text = "Not Found"
		  'txtLong.text = "Not Found"
		  'end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Rectangle1
	#tag Event
		Sub Open()
		  me.AcceptFileDrop("application/zip")
		End Sub
	#tag EndEvent
	#tag Event
		Sub DropObject(obj As DragItem, action As Integer)
		  me.fillColor = &cCCCCCC
		  
		  if (obj.FolderItemAvailable() and obj.FolderItem.type = "application/zip") then
		    addSceneryPackageFromZip(obj.FolderItem)
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Function DragEnter(obj As DragItem, action As Integer) As Boolean
		  if (obj.FolderItemAvailable() and obj.FolderItem.type = "application/zip") then
		    me.fillColor = &cBBCCBB
		    me.refresh
		    return false
		  else
		    return true
		  end if
		End Function
	#tag EndEvent
	#tag Event
		Sub DragExit(obj As DragItem, action As Integer)
		  me.fillColor = &cCCCCCC
		  me.refresh
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lstTextResults
	#tag Event
		Sub Change()
		  if (me.listIndex > -1) then
		    selectPackage(me.rowTag(me.listIndex))
		    btnDownloadAndInstall.enabled = true
		  else
		    selectPackage(-1)
		    btnDownloadAndInstall.enabled = false
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Function CompareRows(row1 as Integer, row2 as Integer, column as Integer, ByRef result as Integer) As Boolean
		  if (column = 2) then
		    result = compareByFileSize(me.cell(row1, column).lowercase(), me.cell(row2, column).lowercase())
		    return true
		  else
		    // Default
		    return false
		  end if
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events Canvas2
	#tag Event
		Sub Open()
		  me.mousecursor = System.Cursors.FingerPointer
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  showURL(App.kURLOrgRegister)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events cnvMap
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  findNearestPackages(x, y)
		  return true
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  'fldTooltip.visible = false
		  'cnvZoom.visible = false
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  'cnvZoom.visible = true
		End Sub
	#tag EndEvent
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  // Copy the off-screen image to the map canvas.
		  g.drawPicture(pMap, 0, 0, me.width, me.height, 0, 0, pMap.width, pMap.height)
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  'dim customSceneryPackage as CustomSceneryPackage
		  'customSceneryPackage = getPackageUnderCursor(x, y)
		  '
		  'moveZoom(x, y)
		  '
		  'if (customSceneryPackage <> nil) then
		  'fldTooltip.text = customSceneryPackage.pName
		  'fldTooltip.visible = true
		  'else
		  'fldTooltip.visible = false
		  'end if
		  '
		  if system.mouseDown then
		    findNearestPackages(x, y)
		  end if
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  findNearestPackages(x, y)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Canvas3
	#tag Event
		Sub Open()
		  me.mousecursor = System.Cursors.FingerPointer
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  showURL(App.kURLOrgRegister)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events htmlDescription
	#tag Event
		Function CancelLoad(URL as String) As Boolean
		  // Load URLs in user's web browser
		  if not pInitialLoad then
		    ShowURL(URL)
		    return true
		  else
		    pInitialLoad = false
		    return false
		  end if
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events btnDownloadAndInstall
	#tag Event
		Sub Action()
		  downloadPackage()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lstLocationResults
	#tag Event
		Sub Change()
		  if (me.listIndex > -1) then
		    btnDownloadAndInstall1.enabled = true
		  else
		    btnDownloadAndInstall1.enabled = false
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Function CompareRows(row1 as Integer, row2 as Integer, column as Integer, ByRef result as Integer) As Boolean
		  if (column = 2) then
		    result = compareByFileSize(me.cell(row1, column).lowercase(), me.cell(row2, column).lowercase())
		    return true
		  else
		    // Default
		    return false
		  end if
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events btnDownloadAndInstall1
	#tag Event
		Sub Action()
		  downloadPackage()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnBrowseForZip
	#tag Event
		Sub Action()
		  addSceneryPackageFromZip()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events sockManifest
	#tag Event
		Sub ReceiveProgress(bytesReceived as integer, totalBytes as integer, newData as string)
		  lblProgress.text = kProgressDownloadingPackageList
		  prgDownload.maximum = totalBytes
		  prgDownload.value = bytesReceived
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub DownloadComplete(url as string, httpStatus as integer, headers as internetHeaders, file as folderItem)
		  lblProgress.text = ""
		  
		  if (httpStatus = 200) then
		    parseManifest(file)
		  else
		    dim parameters() as string = array(str(httpStatus))
		    lblProgress.text = App.processParameterizedString(kErrorDownload, parameters)
		    pOrgUsername = ""
		    pOrgPassword = ""
		  end if
		  
		  prgDownload.visible = false
		End Sub
	#tag EndEvent
	#tag Event
		Sub Error(code as integer)
		  dim parameters() as string = array(str(code))
		  lblProgress.text = App.processParameterizedString(kErrorDownload, parameters)
		  
		  pOrgUsername = ""
		  pOrgPassword = ""
		  
		  prgDownload.visible = false
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events sockFile
	#tag Event
		Sub ReceiveProgress(bytesReceived as integer, totalBytes as integer, newData as string)
		  lblProgress.text = kProgressDownloading
		  prgDownload.maximum = totalBytes
		  prgDownload.value = bytesReceived
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub DownloadComplete(url as string, httpStatus as integer, headers as internetHeaders, file as folderItem)
		  if (httpStatus = 200) then
		    lblProgress.text = kInstalling
		    
		    addSceneryPackageFromZip(file)
		    
		    lblProgress.text = ""
		  else
		    dim parameters() as string = array(str(httpStatus))
		    lblProgress.text = App.processParameterizedString(kErrorDownload, parameters)
		    pOrgUsername = ""
		    pOrgPassword = ""
		  end if
		  
		  prgDownload.visible = false
		End Sub
	#tag EndEvent
	#tag Event
		Sub Error(code as integer)
		  dim parameters() as string = array(str(code))
		  lblProgress.text = App.processParameterizedString(kErrorDownload, parameters)
		  
		  pOrgUsername = ""
		  pOrgPassword = ""
		  
		  prgDownload.visible = false
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events tmrUnzipMonitor
	#tag Event
		Sub Action()
		  if (thrUnzip.state = Thread.NotRunning) then
		    me.mode = Timer.ModeOff
		    
		    if thrUnzip.pExtractedFolderItem <> nil then
		      dim sourceFolderItem as FolderItem = AddOn.searchForAddon(thrUnzip.pExtractedFolderItem, "CustomSceneryPackage")
		      
		      if sourceFolderItem = nil then
		        dim result as integer = App.displayMessage(kErrorNotValidCompressedSceneryPackage, "", MessageDialog.GraphicCaution, App.kOk, "", "", wndInstallSceneryPackage)
		      else
		        CustomSceneryPackage.install(sourceFolderItem)
		        wndMain.scanXPlaneFolder()
		      end if
		    end if
		    
		    lblProgress.text = ""
		  else
		    lblProgress.text = kUncompressingZip
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="BackColor"
		Visible=true
		Group="Appearance"
		InitialValue="&hFFFFFF"
		Type="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Appearance"
		Type="Picture"
		EditorType="Picture"
	#tag EndViewProperty
	#tag ViewProperty
		Name="CloseButton"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Frame"
		Visible=true
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreenButton"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackColor"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="400"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LiveResize"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxHeight"
		Visible=true
		Group="Position"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximizeButton"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxWidth"
		Visible=true
		Group="Position"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Appearance"
		Type="MenuBar"
		EditorType="MenuBar"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinHeight"
		Visible=true
		Group="Position"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimizeButton"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinWidth"
		Visible=true
		Group="Position"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="pCookies"
		Group="Behavior"
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="pInitialLoad"
		Group="Behavior"
		InitialValue="false"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Placement"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="pMap"
		Group="Behavior"
		Type="Picture"
	#tag EndViewProperty
	#tag ViewProperty
		Name="pOrgPassword"
		Group="Behavior"
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="pOrgUsername"
		Group="Behavior"
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Appearance"
		InitialValue="Untitled"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Position"
		InitialValue="600"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
