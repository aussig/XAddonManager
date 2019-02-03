#tag Window
Begin Window wndMain
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   800
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   770
   MenuBar         =   341440760
   MenuBarVisible  =   True
   MinHeight       =   618
   MinimizeButton  =   True
   MinWidth        =   770
   Placement       =   0
   Resizeable      =   True
   Title           =   "#App.kApplicationName"
   Visible         =   False
   Width           =   770
   Begin TabPanel tpnlMain
      AutoDeactivate  =   True
      Bold            =   False
      Enabled         =   True
      Height          =   692
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
      TabDefinition   =   "#kTabTitleCustomSceneryPackages\r#kTabTitlePlugins\r#kTabTitleAircraft\r#kTabTitleCSLs"
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   86
      Transparent     =   True
      Underline       =   False
      Value           =   0
      Visible         =   True
      Width           =   730
      Begin PushButton btnAddScenery
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "#App.kInstallPrompt"
         Default         =   False
         Enabled         =   False
         Height          =   27
         HelpTag         =   "#kHTInstall"
         Index           =   -2147483648
         InitialParent   =   "tpnlMain"
         Italic          =   False
         Left            =   40
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   377
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   138
      End
      Begin ListBox lstCustomSceneryPackages
         AutoDeactivate  =   True
         AutoHideScrollbars=   False
         Bold            =   False
         Border          =   True
         ColumnCount     =   8
         ColumnsResizable=   False
         ColumnWidths    =   "*, 30, 35, 35, 35, 35, 35, 60"
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
         Height          =   241
         HelpTag         =   ""
         Hierarchical    =   True
         Index           =   -2147483648
         InitialParent   =   "tpnlMain"
         InitialValue    =   ""
         Italic          =   False
         Left            =   40
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
         TabIndex        =   1
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   124
         Transparent     =   True
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   690
         _ScrollOffset   =   0
         _ScrollWidth    =   -1
      End
      Begin PushButton btnDeleteScenery
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "#App.kDeletePrompt"
         Default         =   False
         Enabled         =   False
         Height          =   27
         HelpTag         =   "#kHTDelete"
         Index           =   -2147483648
         InitialParent   =   "tpnlMain"
         Italic          =   False
         Left            =   190
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   377
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin PushButton btnDeleteAircraft
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "#App.kDeletePrompt"
         Default         =   False
         Enabled         =   False
         Height          =   27
         HelpTag         =   "#kHTDelete"
         Index           =   -2147483648
         InitialParent   =   "tpnlMain"
         Italic          =   False
         Left            =   132
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   5
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   593
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin PushButton btnAddPlugin
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "#App.kInstallPrompt"
         Default         =   False
         Enabled         =   True
         Height          =   27
         HelpTag         =   "#kHTInstall"
         Index           =   -2147483648
         InitialParent   =   "tpnlMain"
         Italic          =   False
         Left            =   40
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   6
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   737
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin ListBox lstPlugins
         AutoDeactivate  =   True
         AutoHideScrollbars=   False
         Bold            =   False
         Border          =   True
         ColumnCount     =   2
         ColumnsResizable=   False
         ColumnWidths    =   "*, 60"
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
         Height          =   601
         HelpTag         =   ""
         Hierarchical    =   True
         Index           =   -2147483648
         InitialParent   =   "tpnlMain"
         InitialValue    =   ""
         Italic          =   False
         Left            =   40
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
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   124
         Transparent     =   True
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   690
         _ScrollOffset   =   0
         _ScrollWidth    =   -1
      End
      Begin PushButton btnDeletePlugin
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "#App.kDeletePrompt"
         Default         =   False
         Enabled         =   False
         Height          =   27
         HelpTag         =   "#kHTDelete"
         Index           =   -2147483648
         InitialParent   =   "tpnlMain"
         Italic          =   False
         Left            =   132
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   8
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   737
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin ExtendedCheckBox chkEnableAllPlugins
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "#kAll"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   "#kHTEnableAll"
         Index           =   -2147483648
         InitialParent   =   "tpnlMain"
         Italic          =   False
         Left            =   670
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   False
         pTriggerAction  =   True
         Scope           =   0
         State           =   0
         TabIndex        =   10
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   737
         Transparent     =   True
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   60
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
         InitialParent   =   "tpnlMain"
         Left            =   25
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   12
         TabPanelIndex   =   1
         TabStop         =   True
         Top             =   414
         Transparent     =   False
         UseFocusRing    =   False
         Visible         =   True
         Width           =   720
      End
      Begin ExtendedCheckBox chkEnableAllCustomSceneryPackages
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "#kAll"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   "#kHTEnableAll"
         Index           =   -2147483648
         InitialParent   =   "tpnlMain"
         Italic          =   False
         Left            =   658
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   False
         pTriggerAction  =   True
         Scope           =   0
         State           =   0
         TabIndex        =   13
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   377
         Transparent     =   True
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   55
      End
      Begin ListBox lstAircraft
         AutoDeactivate  =   True
         AutoHideScrollbars=   False
         Bold            =   False
         Border          =   True
         ColumnCount     =   7
         ColumnsResizable=   False
         ColumnWidths    =   "*,35,35,35,35,35,35"
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
         Height          =   451
         HelpTag         =   ""
         Hierarchical    =   True
         Index           =   -2147483648
         InitialParent   =   "tpnlMain"
         InitialValue    =   ""
         Italic          =   False
         Left            =   40
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
         TabIndex        =   3
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   124
         Transparent     =   True
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   690
         _ScrollOffset   =   0
         _ScrollWidth    =   -1
      End
      Begin Canvas cnvAircraftIcon
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   128
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "tpnlMain"
         Left            =   40
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   14
         TabPanelIndex   =   3
         TabStop         =   True
         Top             =   632
         Transparent     =   True
         UseFocusRing    =   True
         Visible         =   True
         Width           =   128
      End
      Begin GroupBox grpAircraftKey
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   ""
         Enabled         =   True
         Height          =   38
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "tpnlMain"
         Italic          =   False
         Left            =   352
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   14
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   587
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   378
         Begin Label txtAircraftKey1
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   27
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grpAircraftKey"
            Italic          =   False
            Left            =   360
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   True
            Scope           =   0
            Selectable      =   False
            TabIndex        =   1
            TabPanelIndex   =   3
            TabStop         =   True
            Text            =   "#kAircraftKey1"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "System"
            TextSize        =   9.0
            TextUnit        =   0
            Top             =   595
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   109
         End
         Begin Label txtAircraftKey2
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   27
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grpAircraftKey"
            Italic          =   False
            Left            =   487
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   True
            Scope           =   0
            Selectable      =   False
            TabIndex        =   1
            TabPanelIndex   =   3
            TabStop         =   True
            Text            =   "#kAircraftKey2"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "System"
            TextSize        =   9.0
            TextUnit        =   0
            Top             =   595
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   109
         End
         Begin Label txtAircraftKey3
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   27
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grpAircraftKey"
            Italic          =   False
            Left            =   604
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   True
            Scope           =   0
            Selectable      =   False
            TabIndex        =   1
            TabPanelIndex   =   3
            TabStop         =   True
            Text            =   "#kAircraftKey3"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "System"
            TextSize        =   9.0
            TextUnit        =   0
            Top             =   595
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   120
         End
      End
      Begin GroupBox grpCustomSceneryKey
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   ""
         Enabled         =   True
         Height          =   38
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "tpnlMain"
         Italic          =   False
         Left            =   288
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   11
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   372
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   358
         Begin Label txtCustomSceneryKey1
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   27
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grpCustomSceneryKey"
            Italic          =   False
            Left            =   304
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   True
            Scope           =   0
            Selectable      =   False
            TabIndex        =   1
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   "#kSceneryPackageKey1"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "System"
            TextSize        =   9.0
            TextUnit        =   0
            Top             =   379
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   109
         End
         Begin Label txtCustomSceneryKey2
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   27
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grpCustomSceneryKey"
            Italic          =   False
            Left            =   421
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   True
            Scope           =   0
            Selectable      =   False
            TabIndex        =   1
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   "#kSceneryPackageKey2"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "System"
            TextSize        =   9.0
            TextUnit        =   0
            Top             =   379
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   109
         End
         Begin Label txtCustomSceneryKey3
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   27
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "grpCustomSceneryKey"
            Italic          =   False
            Left            =   541
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Multiline       =   True
            Scope           =   0
            Selectable      =   False
            TabIndex        =   1
            TabPanelIndex   =   1
            TabStop         =   True
            Text            =   "#kSceneryPackageKey3"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "System"
            TextSize        =   9.0
            TextUnit        =   0
            Top             =   379
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   109
         End
      End
      Begin PushButton btnAddAircraft
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "#App.kInstallPrompt"
         Default         =   False
         Enabled         =   False
         Height          =   27
         HelpTag         =   "#kHTInstall"
         Index           =   -2147483648
         InitialParent   =   "tpnlMain"
         Italic          =   False
         Left            =   40
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   593
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin ListBox lstCSLs
         AutoDeactivate  =   True
         AutoHideScrollbars=   False
         Bold            =   False
         Border          =   True
         ColumnCount     =   2
         ColumnsResizable=   False
         ColumnWidths    =   "*, 60"
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
         Height          =   601
         HelpTag         =   ""
         Hierarchical    =   False
         Index           =   -2147483648
         InitialParent   =   "tpnlMain"
         InitialValue    =   ""
         Italic          =   False
         Left            =   40
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
         TabIndex        =   1
         TabPanelIndex   =   4
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   124
         Transparent     =   True
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   690
         _ScrollOffset   =   0
         _ScrollWidth    =   -1
      End
      Begin ExtendedCheckBox chkEnableAllCSLs
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "#kAll"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   "#kHTEnableAll"
         Index           =   -2147483648
         InitialParent   =   "tpnlMain"
         Italic          =   False
         Left            =   670
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   False
         pTriggerAction  =   True
         Scope           =   0
         State           =   0
         TabIndex        =   16
         TabPanelIndex   =   4
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   737
         Transparent     =   True
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   60
      End
      Begin PushButton btnAddCSL
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "#App.kInstallPrompt"
         Default         =   False
         Enabled         =   True
         Height          =   27
         HelpTag         =   "#kHTInstall"
         Index           =   -2147483648
         InitialParent   =   "tpnlMain"
         Italic          =   False
         Left            =   40
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   4
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   737
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin PushButton btnDeleteCSL
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "#App.kDeletePrompt"
         Default         =   False
         Enabled         =   False
         Height          =   27
         HelpTag         =   "#kHTDelete"
         Index           =   -2147483648
         InitialParent   =   "tpnlMain"
         Italic          =   False
         Left            =   132
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   4
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   737
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin TextField fldTooltip
         AcceptTabs      =   False
         Alignment       =   0
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   &cFFCAFF00
         Bold            =   True
         Border          =   False
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   14
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "tpnlMain"
         Italic          =   False
         Left            =   30
         LimitText       =   0
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Mask            =   ""
         Password        =   False
         ReadOnly        =   True
         Scope           =   0
         TabIndex        =   19
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   755
         Transparent     =   True
         Underline       =   False
         UseFocusRing    =   False
         Visible         =   False
         Width           =   710
      End
      Begin PushButton btnNewAircraftFolder
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "#kNewAircraftFolderPrompt"
         Default         =   False
         Enabled         =   False
         Height          =   27
         HelpTag         =   "#kHTNewAircraftFolder"
         Index           =   -2147483648
         InitialParent   =   "tpnlMain"
         Italic          =   False
         Left            =   224
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   15
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   593
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   95
      End
   End
   Begin Canvas cnvLogo
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   64
      HelpTag         =   "#App.kHTVisitWebsite"
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   14
      Transparent     =   True
      UseFocusRing    =   False
      Visible         =   True
      Width           =   64
   End
   Begin PushButton btnSetXPlaneFolder
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "#kSet"
      Default         =   False
      Enabled         =   True
      Height          =   27
      HelpTag         =   "#kHTChooseXPlaneFolder"
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   670
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   13
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin Timer tmrMapRefresh
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Mode            =   2
      Period          =   100
      Scope           =   0
      TabPanelIndex   =   0
   End
   Begin HTTPSocket sckVersionChecker
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
   Begin Canvas cnvZoom
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   False
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   False
      EraseBackground =   False
      Height          =   100
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   558
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   -129
      Transparent     =   False
      UseFocusRing    =   False
      Visible         =   False
      Width           =   100
   End
   Begin BevelButton btnSaveGroup
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   4
      Bold            =   False
      ButtonType      =   0
      Caption         =   ""
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   20
      HelpTag         =   "#kHTSaveGroup"
      Icon            =   1143547903
      IconAlign       =   1
      IconDX          =   0
      IconDY          =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   670
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   57
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   20
   End
   Begin BevelButton btnDeleteGroup
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   4
      Bold            =   False
      ButtonType      =   0
      Caption         =   ""
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   20
      HelpTag         =   "#kHTDeleteGroup"
      Icon            =   1141976848
      IconAlign       =   1
      IconDX          =   0
      IconDY          =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   730
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   57
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   20
   End
   Begin BevelButton btnAddGroup
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   4
      Bold            =   False
      ButtonType      =   0
      Caption         =   ""
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   20
      HelpTag         =   "#kHTCreateGroup"
      Icon            =   1941964564
      IconAlign       =   1
      IconDX          =   0
      IconDY          =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   700
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   57
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   20
   End
   Begin Separator Separator1
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   6
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   96
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   46
      Transparent     =   True
      Visible         =   True
      Width           =   654
   End
   Begin Label txtXPlaneFolderCaption1
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   179
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "#kGroup"
      TextAlign       =   2
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   58
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   120
   End
   Begin PopupMenu popGroups
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   "#kHTSelectGroup"
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "#kNoCurrentGroup\r-"
      Italic          =   False
      Left            =   311
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   57
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   347
   End
   Begin Label txtXplaneFolder
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   "#kHTXPlaneFolder"
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   311
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Untitled"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   21
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   347
   End
   Begin Label txtXPlaneFolderCaption
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   179
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "#kXPlaneFolder"
      TextAlign       =   2
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   10.0
      TextUnit        =   0
      Top             =   21
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   120
   End
   Begin Timer tmrCheckAirportFolderParsed
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Mode            =   2
      Period          =   1000
      Scope           =   0
      TabPanelIndex   =   0
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  dim i as integer
		  
		  // Need to do this explicitly because Destructors are unreliable when quitting the application
		  
		  for i = 2 to popGroups.listCount - 1
		    dim group as Group = popGroups.rowTag(i)
		    group.saveState()
		  next
		  
		  for i = 0 to lstCustomSceneryPackages.listCount - 1
		    dim customSceneryPackage as CustomSceneryPackage = lstCustomSceneryPackages.cellTag(i, 0)
		    customSceneryPackage.saveState()
		  next
		  
		  for i = 0 to lstPlugins.listCount - 1
		    dim plugin as Plugin = lstPlugins.cellTag(i, 0)
		    plugin.saveState()
		  next
		  
		  if (CSL.pAddonClassEnabled) then
		    for i = 0 to lstCSLs.listCount - 1
		      dim csl as CSL = lstCSLs.cellTag(i, 0)
		      csl.saveState()
		    next
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Sub EnableMenuItems()
		  dim plotEnabled as boolean = (tpnlMain.value = 0)
		  PlotAllItem.enabled = plotEnabled
		  PlotNoneItem.enabled = plotEnabled
		  PlotAirportsItem.enabled = plotEnabled
		  PlotSceneryItem.enabled = plotEnabled
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  if not App.pClosing then
		    // Check whether to show the CSL tab
		    if not CSL.checkXPlaneFolder(App.pXPlaneFolder) then
		      tpnlMain.remove(3)
		      CSL.pAddonClassEnabled = false
		    end if
		    
		    displayXPlaneFolder()
		    scanXPlaneFolder()
		    populateGroupsMenu()
		    refreshGroupControls()
		    
		    // The following code now assumes that imgWorldmap contains the large, zoomed map and that we need to
		    // scale this down for the normal view, rather than the opposite as for earlier versions
		    
		    // Create the offscreen picture for drawing the normal version and draw
		    'pMap = new Picture(imgWorldmap.width, imgWorldmap.height, 32)
		    pMap = new Picture(imgWorldmap.width / App.kMapZoomFactor, imgWorldmap.height / App.kMapZoomFactor, 32)
		    plotPackages(pMap.graphics, cnvMap, 1)
		    
		    // Create the offscreen picture for drawing the zoomed version and draw
		    'pZoomedMap = new Picture(imgWorldmap.width * App.kMapZoomFactor, imgWorldmap.height * App.kMapZoomFactor, 32)
		    pZoomedMap = new Picture(imgWorldmap.width, imgWorldmap.height, 32)
		    plotPackages(pZoomedMap.graphics, cnvZoom, App.kMapZoomFactor)
		    
		    // Temporarily disabled, was using old Google Code URL 
		    'sckVersionChecker.get(App.kURLVersion)
		  end if
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function PlotAirportsItem() As Boolean Handles PlotAirportsItem.Action
			dim i as integer
			
			for i = 0 to lstCustomSceneryPackages.listCount - 1
			// Rows that are expanded won't have checkboxes
			dim customSceneryPackage as CustomSceneryPackage = lstCustomSceneryPackages.cellTag(i, 0)
			if lstCustomSceneryPackages.cellType(i, 6) = ListBox.TypeDefault or lstCustomSceneryPackages.cellType(i, 6) = ListBox.TypeCheckbox then
			lstCustomSceneryPackages.cellCheck(i, 6) = customSceneryPackage.hasAirportData(CustomSceneryPackage.kPlanetEarth)
			customSceneryPackage.shownOnMap(customSceneryPackage.hasAirportData(CustomSceneryPackage.kPlanetEarth))
			end if
			next
			
			plotPackages(pMap.graphics, cnvMap, 1)
			plotPackages(pZoomedMap.graphics, cnvZoom, App.kMapZoomFactor)
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function PlotAllItem() As Boolean Handles PlotAllItem.Action
			dim i as integer
			
			for i = 0 to lstCustomSceneryPackages.listCount - 1
			// Rows that are expanded won't have checkboxes
			dim customSceneryPackage as CustomSceneryPackage = lstCustomSceneryPackages.cellTag(i, 0)
			if lstCustomSceneryPackages.cellType(i, 6) = ListBox.TypeDefault or lstCustomSceneryPackages.cellType(i, 6) = ListBox.TypeCheckbox then
			lstCustomSceneryPackages.cellCheck(i, 6) = true
			customSceneryPackage.shownOnMap(true)
			end if
			next
			
			plotPackages(pMap.graphics, cnvMap, 1)
			plotPackages(pZoomedMap.graphics, cnvZoom, App.kMapZoomFactor)
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function PlotNoneItem() As Boolean Handles PlotNoneItem.Action
			dim i as integer
			
			for i = 0 to lstCustomSceneryPackages.listCount - 1
			// Rows that are expanded won't have checkboxes
			dim customSceneryPackage as CustomSceneryPackage = lstCustomSceneryPackages.cellTag(i, 0)
			if lstCustomSceneryPackages.cellType(i, 6) = ListBox.TypeDefault or lstCustomSceneryPackages.cellType(i, 6) = ListBox.TypeCheckbox then
			lstCustomSceneryPackages.cellCheck(i, 6) = false
			customSceneryPackage.shownOnMap(false)
			end if
			next
			
			plotPackages(pMap.graphics, cnvMap, 1)
			plotPackages(pZoomedMap.graphics, cnvZoom, App.kMapZoomFactor)
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function PlotSceneryItem() As Boolean Handles PlotSceneryItem.Action
			dim i as integer
			
			for i = 0 to lstCustomSceneryPackages.listCount - 1
			// Rows that are expanded won't have checkboxes
			dim customSceneryPackage as CustomSceneryPackage = lstCustomSceneryPackages.cellTag(i, 0)
			if lstCustomSceneryPackages.cellType(i, 6) = ListBox.TypeDefault or lstCustomSceneryPackages.cellType(i, 6) = ListBox.TypeCheckbox then
			lstCustomSceneryPackages.cellCheck(i, 6) = customSceneryPackage.hasScenery(CustomSceneryPackage.kPlanetEarth)
			customSceneryPackage.shownOnMap(customSceneryPackage.hasScenery(CustomSceneryPackage.kPlanetEarth))
			end if
			next
			
			plotPackages(pMap.graphics, cnvMap, 1)
			plotPackages(pZoomedMap.graphics, cnvZoom, App.kMapZoomFactor)
			
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Sub addAircraft()
		  dim dialog as SelectFolderDialog
		  dim folderItem as FolderItem
		  
		  dim zipType As new FileType
		  zipType.Name = "application/zip"
		  zipType.MacType = "ZIP "
		  zipType.Extensions = "zip"
		  
		  while true
		    folderItem = getOpenFolderItem(zipType)
		    
		    if (folderItem = nil) then
		      return
		    end if
		    
		    dim sourceFolderItem as FolderItem = Addon.extractZipToTemporaryLocation(folderItem)
		    if sourceFolderItem = nil then return
		    sourceFolderItem = AddOn.searchForAddon(sourceFolderItem, "Aircraft")
		    
		    if sourceFolderItem = nil then
		      dim result as Integer = App.displayMessage(kErrorNotValidCompressedAircraftPackage, "", MessageDialog.GraphicCaution, App.kOk, "", "", me)
		    else
		      dim destinationAircraftFolder as AircraftFolder = lstAircraft.cellTag(lstAircraft.listIndex, 0)
		      Aircraft.install(sourceFolderItem, destinationAircraftFolder.pFolderItem)
		      return
		    end if
		  wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub addCSL()
		  dim dialog as SelectFolderDialog
		  dim folderItem as FolderItem
		  
		  dim zipType As new FileType
		  zipType.Name = "application/zip"
		  zipType.MacType = "ZIP "
		  zipType.Extensions = "zip"
		  
		  while true
		    folderItem = getOpenFolderItem(zipType)
		    
		    if (folderItem = nil) then
		      return
		    end if
		    
		    dim sourceFolderItem as FolderItem = Addon.extractZipToTemporaryLocation(folderItem)
		    if sourceFolderItem = nil then return
		    sourceFolderItem = AddOn.searchForAddon(sourceFolderItem, "CSL")
		    
		    if sourceFolderItem = nil then
		      dim result as Integer = App.displayMessage(kErrorNotValidCompressedCSLPackage, "", MessageDialog.GraphicCaution, App.kOk, "", "", me)
		    else
		      CSL.install(sourceFolderItem)
		      scanXPlaneFolder()
		      return
		    end if
		  wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub addPlugin()
		  dim dialog as SelectFolderDialog
		  dim folderItem as FolderItem
		  
		  dim zipType As new FileType
		  zipType.Name = "application/zip"
		  zipType.MacType = "ZIP "
		  zipType.Extensions = "zip"
		  
		  while true
		    folderItem = getOpenFolderItem(zipType)
		    
		    if (folderItem = nil) then
		      return
		    end if
		    
		    dim sourceFolderItem as FolderItem = Addon.extractZipToTemporaryLocation(folderItem)
		    if sourceFolderItem = nil then return
		    sourceFolderItem = AddOn.searchForAddon(sourceFolderItem, "Plugin")
		    
		    if sourceFolderItem = nil then
		      dim result as Integer = App.displayMessage(kErrorNotValidCompressedPluginPackage, "", MessageDialog.GraphicCaution, App.kOk, "", "", me)
		    else
		      Plugin.install(sourceFolderItem)
		      scanXPlaneFolder()
		      return
		    end if
		  wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub addSceneryPackage()
		  dim dialog as SelectFolderDialog
		  dim folderItem as FolderItem
		  
		  dim zipType As new FileType
		  zipType.Name = "application/zip"
		  zipType.MacType = "ZIP "
		  zipType.Extensions = "zip"
		  
		  while true
		    folderItem = getOpenFolderItem(zipType)
		    
		    if (folderItem = nil) then
		      return
		    end if
		    
		    dim sourceFolderItem as FolderItem = Addon.extractZipToTemporaryLocation(folderItem)
		    if sourceFolderItem = nil then return
		    sourceFolderItem = AddOn.searchForAddon(sourceFolderItem, "CustomSceneryPackage")
		    
		    if sourceFolderItem = nil then
		      dim result as Integer = App.displayMessage(kErrorNotValidCompressedSceneryPackage, "", MessageDialog.GraphicCaution, App.kOk, "", "", me)
		    else
		      CustomSceneryPackage.install(sourceFolderItem)
		      scanXPlaneFolder()
		      return
		    end if
		  wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub createAircraftFolder(folderName as string)
		  dim aircraftFolder as AircraftFolder = lstAircraft.cellTag(lstAircraft.listIndex, 0)
		  aircraftFolder.pFolderItem.child(folderName).createAsFolder()
		  
		  // Collapse and expand the row to refresh its contents
		  lstAircraft.expanded(lstAircraft.listIndex) = false
		  lstAircraft.refresh()
		  lstAircraft.expanded(lstAircraft.listIndex) = true
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub createGroup(groupName as String)
		  dim group as Group
		  group = new Group(groupName, App.pXPlaneFolder)
		  group.populatePopupMenuEntry(popGroups)
		  
		  // Store the addon state
		  group.getAddonState(me)
		  
		  // Select the newly added (last) item
		  popGroups.listIndex = popGroups.listCount - 1
		  
		  pCurrentGroup = group
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub deleteAircraft()
		  dim aircraft as Aircraft = lstAircraft.cellTag(lstAircraft.listIndex, 0)
		  aircraft.delete()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub deleteCSL()
		  dim csl as CSL = lstCSLs.cellTag(lstCSLs.listIndex, 0)
		  csl.delete()
		  scanXPlaneFolder()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub deleteCurrentGroup()
		  dim group as Group = popGroups.rowTag(popGroups.listIndex)
		  dim groupName as String = group.pName
		  popGroups.removeRow(popGroups.listIndex)
		  
		  // This deletes the last reference to the Group so it's Destructor will be called
		  group = nil
		  
		  // Now delete the group from the preferences dictionary
		  Group.deleteGroup(groupName, App.pXPlaneFolder)
		  
		  // Select the 'No current group' item
		  popGroups.listIndex = 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub deletePlugin()
		  dim plugin as Plugin = lstPlugins.cellTag(lstPlugins.listIndex, 0)
		  plugin.delete()
		  scanXPlaneFolder()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub deleteSceneryPackage()
		  dim customSceneryPackage as CustomSceneryPackage = lstCustomSceneryPackages.cellTag(lstCustomSceneryPackages.listIndex, 0)
		  customSceneryPackage.delete()
		  scanXPlaneFolder()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub displayXPlaneFolder()
		  txtXplaneFolder.text = App.pXPlaneFolder.absolutePath
		  App.pPreferences.setLastXPlaneFolder(App.pXPlaneFolder.absolutePath)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub enableAll(listType as integer, selected as boolean)
		  dim listBox as ListBox = getListBox(listType)
		  dim i as integer
		  
		  for i = 0 to listBox.listCount - 1
		    dim instance as Addon = listBox.cellTag(i, 0)
		    instance.enable(selected)
		  next
		  
		  // Any change to enabled addons sets the dirty flag
		  if (pCurrentGroup <> nil) then pCurrentGroup.pDirty = true
		  
		  scanXPlaneFolder()
		  
		  if (listType = kListCustomSceneryPackages) then
		    plotPackages(pMap.graphics, cnvMap, 1)
		    plotPackages(pZoomedMap.graphics, cnvZoom, App.kMapZoomFactor)
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getEnableAllCheckBox(listType as integer) As ExtendedCheckBox
		  select case listType
		  case kListCustomSceneryPackages
		    return chkEnableAllCustomSceneryPackages
		  case kListPlugins
		    return chkEnableAllPlugins
		  case kListCSLs
		    return chkEnableAllCSLs
		  end select
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getListBox(listType as integer) As ListBox
		  select case listType
		  case kListCustomSceneryPackages
		    return lstCustomSceneryPackages
		  case kListPlugins
		    return lstPlugins
		  case kListAircraft
		    return lstAircraft
		  case kListCSLs
		    return lstCSLs
		  end select
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getPackageUnderCursor(x as integer, y as integer) As CustomSceneryPackage
		  dim i as integer
		  dim minDistance as double = 10000
		  dim closestPackage as CustomSceneryPackage = nil
		  
		  for i = 0 to lstCustomSceneryPackages.listCount - 1
		    dim customSceneryPackage as CustomSceneryPackage = lstCustomSceneryPackages.cellTag(i, 0)
		    dim distance as double = customSceneryPackage.getMinDistanceFrom(x, y)
		    if distance < 3.0 then
		      minDistance = distance
		      closestPackage = customSceneryPackage
		    end if
		    // If the user is on top of a package then there's no point iterating further
		    if minDistance = 0.0 then return closestPackage
		  next
		  
		  return closestPackage
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub groupSelected()
		  // If there is no currently selected listindex (usually only after a delete) then set it to 0
		  if (popGroups.listIndex = -1) then
		    pCurrentGroup = nil
		    popGroups.listIndex = 0
		    refreshGroupControls()
		    return
		  end if
		  
		  // If we're selecting the same group then don't do anything
		  if (pCurrentGroup = popGroups.rowTag(popGroups.listIndex)) then return
		  
		  // Check whether the current group has been edited.  If so, show a warning
		  dim result as Integer = 1
		  if (pCurrentGroup <> nil and pCurrentGroup.pDirty) then
		    result = App.displayMessage(kConfirmSwitchGroups, "", MessageDialog.GraphicCaution, App.kOk, App.kSave, App.kCancel, me)
		  end if
		  
		  // Save the group if the user has clicked 'save'
		  if (result = 2) then
		    saveGroup()
		  end if
		  
		  // Change group if the user has agreed to the dialog
		  if (result = 1 or result = 2) then
		    if (popGroups.listIndex > 1) then
		      me.MouseCursor= System.Cursors.Wait
		      pCurrentGroup = popGroups.rowTag(popGroups.listIndex)
		      pCurrentGroup.setAddonState(wndMain)
		      pCurrentGroup.pDirty = false
		      scanXPlaneFolder()
		      me.MouseCursor= System.Cursors.StandardPointer
		    else
		      pCurrentGroup = nil
		    end if
		    
		    refreshGroupControls()
		  else
		    reselectCurrentGroup()
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub moveZoom(x as integer, y as integer)
		  // Move the zoom canvas, bound it within the parent canvas
		  cnvZoom.top = min(cnvMap.top + cnvMap.height - cnvZoom.height, max(cnvMap.top, cnvMap.top + y - cnvZoom.height / 2))
		  cnvZoom.left = min(cnvMap.left + cnvMap.width - cnvZoom.width, max(cnvMap.left, cnvMap.left + x - cnvZoom.width / 2))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub plotPackages(g as Graphics, rc as RectControl, viewportZoomFactor as double)
		  dim i as integer
		  dim selectedPackage as customSceneryPackage
		  
		  // Redraw the map on the offscreen buffer (provides a clean map to draw packages on, wiping out highlights etc)
		  g.drawPicture(imgWorldmap, 0, 0, g.width, g.height, 0, 0, imgWorldmap.width, imgWorldmap.height)
		  'g.drawPicture(imgWorldmap, 0, 0, imgWorldmap.width * viewportZoomFactor, imgWorldmap.height * viewportZoomFactor, 0, 0, imgWorldmap.width, imgWorldmap.height)
		  'g.drawPicture(imgWorldmap, 0, 0, imgWorldmap.width, imgWorldmap.height, 0, 0, imgWorldmap.width, imgWorldmap.height)
		  
		  for i = 0 to lstCustomSceneryPackages.listCount - 1
		    dim customSceneryPackage as CustomSceneryPackage = lstCustomSceneryPackages.cellTag(i, 0)
		    
		    if lstCustomSceneryPackages.listIndex = i then
		      // Selected package, store it for drawing last
		      selectedPackage = customSceneryPackage
		    else
		      // Draw the package
		      customSceneryPackage.plotOnMap(g, rc, CustomSceneryPackage.kPlanetEarth, false, viewportZoomFactor)
		    end if
		  next
		  
		  // Draw the selected package last so that the highlight always gets drawn on top of everything else
		  if selectedPackage <> nil then
		    selectedPackage.plotOnMap(g, rc, CustomSceneryPackage.kPlanetEarth, true, viewportZoomFactor)
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub populateGroupsMenu()
		  dim groups() as Group = Group.getGroups(App.pXPlaneFolder)
		  dim i as Integer
		  
		  for i = 0 to ubound(groups)
		    groups(i).populatePopupMenuEntry(popGroups)
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub refreshAircraftDisplay()
		  if lstAircraft.listIndex > -1 then
		    // An item is selected
		    if lstAircraft.cellTag(lstAircraft.listIndex, 0) isa Aircraft then
		      // An aircraft is selected
		      dim aircraft as Aircraft = lstAircraft.cellTag(lstAircraft.listIndex, 0)
		      aircraft.displayDetails(cnvAircraftIcon)
		    elseif lstAircraft.cellTag(lstAircraft.listIndex, 0) isa AircraftFolder then
		      // An AircraftFolder is selected
		      dim aircraftFolder as AircraftFolder = lstAircraft.cellTag(lstAircraft.listIndex, 0)
		      aircraftFolder.displayDetails(cnvAircraftIcon)
		    else
		      // Should never get here (only Aircraft and AircraftFolders are added to the ListBox in the first place)
		    end if
		  else
		    // Nothing selected, clear the info panel
		    
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub refreshEnableAllCheckBox(listType as integer)
		  dim checkBox as ExtendedCheckBox
		  dim listBox as ListBox
		  dim allSelected as boolean = true
		  
		  listBox = getListBox(listType)
		  checkBox = getEnableAllCheckBox(listType)
		  
		  dim i as integer
		  
		  for i = 0 to listBox.listCount - 1
		    dim instance as Addon = listBox.cellTag(i, 0)
		    if not instance.pEnabled then allSelected = false
		  next
		  
		  checkBox.setValue(allSelected, false)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub refreshGroupControls()
		  dim i, itemCount as Integer
		  dim selectedGroup as Group = nil
		  itemCount = popGroups.listCount - 1
		  
		  // Check whether a group is selected.  First item is 'No Group Selected', second item is separator
		  dim groupSelected as boolean = (popGroups.listIndex > 1)
		  if (groupSelected) then selectedGroup = popGroups.rowTag(popGroups.listIndex)
		  
		  // Check whether the user has changed the enabled addons.
		  dim addonsChanged as boolean = pCurrentGroup <> nil and pCurrentGroup.pDirty = true
		  
		  // Enable the buttons
		  btnSaveGroup.enabled = groupSelected and addonsChanged
		  btnAddGroup.enabled = true
		  btnDeleteGroup.enabled = groupSelected
		  //btnInfoGroup.enabled = groupSelected
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub reselectCurrentGroup()
		  dim i as Integer
		  
		  if (pCurrentGroup = nil) then return
		  
		  for i = 2 to popGroups.listCount - 1
		    if popGroups.rowTag(i) = pCurrentGroup then
		      popGroups.listIndex = i
		    end if
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub saveGroup()
		  if (pCurrentGroup <> nil) then
		    pCurrentGroup.getAddonState(wndMain)
		    pCurrentGroup.pDirty = false
		    refreshGroupControls()
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub scanXPlaneFolder()
		  dim containerFolderItem as FolderItem
		  dim count, i, index as integer
		  
		  // Stop change events from firing
		  pTriggerChangeEvents = false
		  
		  // Clear the listboxes
		  lstCustomSceneryPackages.deleteAllRows
		  lstPlugins.deleteAllRows
		  lstAircraft.deleteAllRows
		  if CSL.pAddonClassEnabled then lstCSLs.deleteAllRows
		  
		  // Reenable change events
		  pTriggerChangeEvents = true
		  
		  containerFolderItem = CustomSceneryPackage.getRootFolder()
		  count = containerFolderItem.count
		  
		  for i = 1 to count
		    dim folderItem as FolderItem = containerFolderItem.trueItem(i)
		    
		    if folderItem <> nil then
		      if CustomSceneryPackage.isValid(folderItem) then
		        dim customSceneryPackage as CustomSceneryPackage
		        customSceneryPackage = new CustomSceneryPackage(folderItem.name, folderItem, true, App.pXPlaneFolder)
		        customSceneryPackage.populateListBoxEntry(lstCustomSceneryPackages)
		      end if
		    end if
		  next
		  
		  containerFolderItem = CustomSceneryPackage.getRootFolder(false)
		  count = containerFolderItem.count
		  
		  for i = 1 to count
		    dim folderItem as FolderItem = containerFolderItem.trueItem(i)
		    
		    if folderItem <> nil then
		      if CustomSceneryPackage.isValid(folderItem) then
		        dim customSceneryPackage as CustomSceneryPackage
		        customSceneryPackage = new CustomSceneryPackage(folderItem.name, folderItem, false, App.pXPlaneFolder)
		        customSceneryPackage.populateListBoxEntry(lstCustomSceneryPackages)
		      end if
		    end if
		  next
		  
		  containerFolderItem = Plugin.getRootFolder()
		  count = containerFolderItem.Count
		  
		  for i = 1 to count
		    dim folderItem as FolderItem = containerFolderItem.TrueItem(i)
		    
		    if folderItem <> nil then
		      if Plugin.isValid(folderItem) then
		        dim plugin as Plugin
		        plugin = Plugin.getInstance(folderItem.name, folderItem, true, App.pXPlaneFolder)
		        plugin.populateListBoxEntry(lstPlugins)
		      end if
		    end if
		  next
		  
		  containerFolderItem = Plugin.getRootFolder(false)
		  count = containerFolderItem.Count
		  
		  for i = 1 to count
		    dim folderItem as FolderItem = containerFolderItem.TrueItem(i)
		    
		    if folderItem <> nil then
		      if Plugin.isValid(folderItem) then
		        dim plugin as Plugin
		        plugin = Plugin.getInstance(folderItem.name, folderItem, false, App.pXPlaneFolder)
		        plugin.populateListBoxEntry(lstPlugins)
		      end if
		    end if
		  next
		  
		  containerFolderItem = Aircraft.getRootFolder()
		  count = containerFolderItem.Count
		  index = 0
		  
		  for i = 1 to count
		    dim folderItem as FolderItem = containerFolderItem.TrueItem(i)
		    
		    if folderItem <> nil then
		      if Aircraft.isValid(folderItem) then
		        dim aircraft as Aircraft
		        aircraft = new Aircraft(folderItem.name, folderItem, true, App.pXPlaneFolder)
		        aircraft.populateListBoxEntry(lstAircraft)
		      elseif AircraftFolder.isValid(folderItem) then
		        // It's a valid AircraftContainer
		        dim aircraftFolder as new AircraftFolder(folderItem.Name, folderItem, true, App.pXPlaneFolder)
		        aircraftFolder.populateListBoxEntry(lstAircraft)
		      else
		        // Don't display anything else
		      End if
		    end if
		  next
		  
		  if CSL.pAddonClassEnabled then
		    containerFolderItem = CSL.getRootFolder()
		    count = containerFolderItem.Count
		    
		    for i = 1 to count
		      dim folderItem as FolderItem = containerFolderItem.TrueItem(i)
		      
		      if folderItem <> nil then
		        if CSL.isValid(folderItem) then
		          dim csl as CSL
		          csl = new CSL(folderItem.name, folderItem, true, App.pXPlaneFolder)
		          csl.populateListBoxEntry(lstCSLs)
		        end if
		      end if
		    next
		    
		    containerFolderItem = CSL.getRootFolder(false)
		    count = containerFolderItem.Count
		    
		    for i = 1 to count
		      dim folderItem as FolderItem = containerFolderItem.TrueItem(i)
		      
		      if folderItem <> nil then
		        if CSL.isValid(folderItem) then
		          dim csl as CSL
		          csl = new CSL(folderItem.name, folderItem, false, App.pXPlaneFolder)
		          csl.populateListBoxEntry(lstCSLs)
		        end if
		      end if
		    next
		  end if
		  
		  
		  // Sort the listboxes
		  lstCustomSceneryPackages.sort
		  lstPlugins.sort
		  lstAircraft.sort
		  if CSL.pAddonClassEnabled then lstCSLs.sort
		  
		  refreshEnableAllCheckBox(kListCustomSceneryPackages)
		  refreshEnableAllCheckBox(kListPlugins)
		  if CSL.pAddonClassEnabled then refreshEnableAllCheckBox(kListCSLs)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub selectNearestPackage(x as integer, y as integer)
		  dim i as integer
		  dim minDistance as double = 10000
		  dim closestPackage as CustomSceneryPackage = nil
		  
		  for i = 0 to lstCustomSceneryPackages.listCount - 1
		    dim customSceneryPackage as CustomSceneryPackage = lstCustomSceneryPackages.cellTag(i, 0)
		    dim distance as double = customSceneryPackage.getMinDistanceFrom(x, y)
		    if distance < minDistance then
		      minDistance = distance
		      closestPackage = customSceneryPackage
		    end if
		    // If the user is on top of a package then there's no point iterating further
		    if minDistance = 0.0 then exit
		  next
		  
		  if closestPackage <> nil then
		    for i = 0 to lstCustomSceneryPackages.listCount - 1
		      if lstCustomSceneryPackages.cellTag(i, 0) = closestPackage then
		        lstCustomSceneryPackages.listIndex = i
		        return
		      end if
		    next
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function underscoreSensitiveCompare(string1 as String, string2 as String, ByRef result as integer) As Boolean
		  // This method works the same way as REALbasic behaviour - the return value is used to determine whether to use the default RB sort,
		  // and the ByRef result parameter is used to send back the compare result
		  
		  // Override sort so that items beginning with '_' sort to the top
		  if string1.left(1) <> "_" and string2.left(1) <> "_" then
		    // Default sorting
		    return false
		  elseif string1.left(1) = "_" and string2.left(1) <> "_" then
		    // '_' sorts above
		    result = -1
		    return true
		  elseif string1.left(1) <>"_" and string2.left(1) = "_" then
		    // '_' sorts above
		    result = 1
		    return true
		  else
		    // Both cells start with '_', sort from the second character
		    result = strcomp(string1.mid(1), string2.mid(1), 1)
		    return true
		  end if
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		pCurrentGroup As Group = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		pMap As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		pTriggerChangeEvents As boolean = true
	#tag EndProperty

	#tag Property, Flags = &h0
		pZoomedMap As Picture
	#tag EndProperty


	#tag Constant, Name = kAircraftKey1, Type = String, Dynamic = True, Default = \"3D - 3D Cockpit\rA - Airfoils(s)", Scope = Public
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"3D - Cabina 3D\rA - Aerodin\xC3\xA0mica(es)"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"3D -  Interni cabina in 3D\rA - Profili Alari"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"3D - Cockpit 3D\rA - Airfoil(s)"
	#tag EndConstant

	#tag Constant, Name = kAircraftKey2, Type = String, Dynamic = True, Default = \"S - Sound(s)\rW - Weapon(s)", Scope = Public
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"S - So(ns)\rW - Arma(es)"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"S - Suoni\rW - Armamenti"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"S - Son(s)\rW - Arme(s)"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"S - Sonido(s)\rW - Weapon(s)"
	#tag EndConstant

	#tag Constant, Name = kAircraftKey3, Type = String, Dynamic = True, Default = \"P - Plugin(s)\rG - Goodway enabled", Scope = Public
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"P - Connector(s)\rG - Goodway habilitat"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"P - Plugins\rG - Goowday abilitato"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"P - Plugin(s)\rG - Compatible Goodway"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"P - Plugin(s)\rG - Goodway compatible"
	#tag EndConstant

	#tag Constant, Name = kAll, Type = String, Dynamic = True, Default = \"All", Scope = Public
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Tot"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Tutto"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Tout"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Alles"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Todo"
	#tag EndConstant

	#tag Constant, Name = kAnEnabled, Type = String, Dynamic = True, Default = \"An enabled", Scope = Public
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Un habilitat"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Abilitato"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Activ\xC3\xA9"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Ein Aktiviertes"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Un activado"
	#tag EndConstant

	#tag Constant, Name = kCollectingLocalFileInformation, Type = String, Dynamic = True, Default = \"Collecting local file information\xE2\x80\xA6", Scope = Public
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Recabando informaci\xC3\xB3n de archivos locales\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Collecte des informations locales\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"S\'est\xC3\xA0 recollint informaci\xC3\xB3 dels fitxers locals\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Raccolgo informazioni\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Lokale Datei Informationen werden gesammelt\xE2\x80\xA6"
	#tag EndConstant

	#tag Constant, Name = kColumnTitle3dCockpit, Type = String, Dynamic = True, Default = \"3D", Scope = Public
		#Tag Instance, Platform = Any, Language = it, Definition  = \"3D"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"3D"
	#tag EndConstant

	#tag Constant, Name = kColumnTitleAirfoils, Type = String, Dynamic = True, Default = \"A", Scope = Public
		#Tag Instance, Platform = Any, Language = it, Definition  = \"A"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"A"
	#tag EndConstant

	#tag Constant, Name = kColumnTitleEarthAirportData, Type = String, Dynamic = True, Default = \"EA", Scope = Public
		#Tag Instance, Platform = Any, Language = it, Definition  = \"EA"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"AT"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"EA"
	#tag EndConstant

	#tag Constant, Name = kColumnTitleEarthScenery, Type = String, Dynamic = True, Default = \"ES", Scope = Public
		#Tag Instance, Platform = Any, Language = it, Definition  = \"ES"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"ET"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"ES"
	#tag EndConstant

	#tag Constant, Name = kColumnTitleEnabled, Type = String, Dynamic = True, Default = \"Enable", Scope = Public
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Habilita"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Abilito"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Activer"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Freigeben"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Activar"
	#tag EndConstant

	#tag Constant, Name = kColumnTitleGoodway, Type = String, Dynamic = True, Default = \"G", Scope = Public
		#Tag Instance, Platform = Any, Language = it, Definition  = \"G"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"G"
	#tag EndConstant

	#tag Constant, Name = kColumnTitleLibrary, Type = String, Dynamic = True, Default = \"L", Scope = Public
		#Tag Instance, Platform = Any, Language = it, Definition  = \"L"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"L"
	#tag EndConstant

	#tag Constant, Name = kColumnTitleMarsAirportData, Type = String, Dynamic = True, Default = \"MA", Scope = Public
		#Tag Instance, Platform = Any, Language = it, Definition  = \"MA"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"AM"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"MA"
	#tag EndConstant

	#tag Constant, Name = kColumnTitleMarsScenery, Type = String, Dynamic = True, Default = \"MS", Scope = Public
		#Tag Instance, Platform = Any, Language = it, Definition  = \"MS"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"EM"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"MS"
	#tag EndConstant

	#tag Constant, Name = kColumnTitleName, Type = String, Dynamic = True, Default = \"Name", Scope = Public
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Nom"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Nome"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Nom"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Name"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Nombre"
	#tag EndConstant

	#tag Constant, Name = kColumnTitlePlugins, Type = String, Dynamic = True, Default = \"P", Scope = Public
		#Tag Instance, Platform = Any, Language = it, Definition  = \"P"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"P"
	#tag EndConstant

	#tag Constant, Name = kColumnTitleShownOnMap, Type = String, Dynamic = True, Default = \"Plot", Scope = Public
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Tra\xC3\xA7"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Traccia"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Point"
	#tag EndConstant

	#tag Constant, Name = kColumnTitleSounds, Type = String, Dynamic = True, Default = \"S", Scope = Public
		#Tag Instance, Platform = Any, Language = it, Definition  = \"S"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"S"
	#tag EndConstant

	#tag Constant, Name = kColumnTitleWeapons, Type = String, Dynamic = True, Default = \"W", Scope = Public
		#Tag Instance, Platform = Any, Language = it, Definition  = \"W"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"W"
	#tag EndConstant

	#tag Constant, Name = kComplete, Type = String, Dynamic = True, Default = \"Complete.", Scope = Public
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Completo."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Termin\xC3\xA9."
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Completat."
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Completo."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Fertig."
	#tag EndConstant

	#tag Constant, Name = kConfirmDelete, Type = String, Dynamic = True, Default = \"Are you sure you want to PERMANENTLY delete the currently ${1} scenery package titled \'${2}\'\?", Scope = Public
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Esteu segur de voler esborrar PERMANENTMENT el paquet d\'escenari ${1} titulat \'${2}\'\?"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Sei sicuro di voler cancellare PERMANENTEMENTE il pacchetto ${1} intitolato \'${2}\'\?"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Etes-vous sur de vouloir supprimer DEFINITIVEMENT la sc\xC3\xA8ne ${1} nomm\xC3\xA9e \'${2}\'\?"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Sind sie sicher dass sie dass ${1} scenery Packet mit dem Namen \'${2}  l\xC3\xB6schen wollen \?"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Est\xC3\xA1s seguro que quieres borrar PERMANENTEMENTE el actual ${1} paquete de escenario denominado \'${2}\'\?"
	#tag EndConstant

	#tag Constant, Name = kConfirmDeleteGroup, Type = String, Dynamic = True, Default = \"Are you sure you want to delete the group \'${1}\'\?", Scope = Public
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Sei sicuro di voler elimianre il gruppo ${1}\'\?"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"\xC3\x8Ates-vosu sure de vouloir effacer le groupe \'${1}\'\?"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Segur que voleu suprimir el grup \'${1}\'\?"
	#tag EndConstant

	#tag Constant, Name = kConfirmSwitchGroups, Type = String, Dynamic = True, Default = \"You have not saved your changes\x2C are you sure you want to load a different group\?", Scope = Public
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Non hai salvato i tuoi cambiamenti\x2C sei sicuro di voler caricare un gruppo differente\?"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Vous n\'avez pas enregistr\xC3\xA9 vos changements. \xC3\x8Ates-vosu sure de vouloir charger un groupe diff\xC3\xA9rent \? "
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"No heu desat els canvis. Segur que voleu carregar un grup diferent\?"
	#tag EndConstant

	#tag Constant, Name = kDisabled, Type = String, Dynamic = True, Default = \"disabled", Scope = Public
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"deshabilitat"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"disabilitato"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"D\xC3\xA9sactiv\xC3\xA9"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Deaktiviert"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Desactivado"
	#tag EndConstant

	#tag Constant, Name = kDisabledItemSwapped, Type = String, Dynamic = True, Default = \"Note: A disabled item named \'${1}\' already exists\x2C so the two items have been swapped: The enabled item is now disabled\x2C and the disabled item is now enabled.", Scope = Public
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Nota: Ja existeix un element desactivat anomenat \'${1}\'\x2C aix\xC3\xAD que els elements s\'han intercanviat: L\'element activat ara est\xC3\xA0 desactivat \x2C i l\'element desactivat ara est\xC3\xA0 activat."
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Nota: Un elemento disabilitato \'${1}\' gi\xC3\xA0 esiste\x2C quindi quindi i due elementi sono stati scambiati: L\'elemento che prima era abilitato \xC3\xA8 ora disabilitato mentre l\'elemento precedentemente disabilitato \xC3\xA8 ora abilitato."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Note : un item nomm\xC3\xA9  \'${1}\'  existe d\xC3\xA9j\xC3\xA0\x2C les deux items ont donc \xC3\xA9t\xC3\xA9 \xC3\xA9chang\xC3\xA9. L\'actif est maintenant d\xC3\xA9sactiv\xC3\xA9\x2C le d\xC3\xA9sactiv\xC3\xA9 est maintenant actif."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Notiz: Ein Element mit dem Namen \'${1}\' ist Deaktiviert\x2C daher wurden beide Elemente ausgetauscht: Das freigegebene Element ist jetzt deaktiviert und das vorhin deaktivierte ist jetzt freigegeben."
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Nota: un item deshabilitado llamado \'${1}\' ya existe\x2C  \'${1}\' ya existe\x2C como consecuencia el item anterior ahora estar\xC3\xA1 desactivado y se activar\xC3\xA1 el nuevo."
	#tag EndConstant

	#tag Constant, Name = kEnabled, Type = String, Dynamic = True, Default = \"enabled", Scope = Public
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"habilitat"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"abilitato"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"activ\xC3\xA9"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"freigegeben"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"activado"
	#tag EndConstant

	#tag Constant, Name = kEnabledItemSwapped, Type = String, Dynamic = True, Default = \"Note: An enabled item named \'${1}\' already exists\x2C so the two items have been swapped: The enabled item is now disabled\x2C and the disabled item is now enabled.", Scope = Public
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Nota: Ja existeix un element activat anomenat \'${1}\'\x2C aix\xC3\xAD que els elements s\'han intercanviat: L\'element activat ara est\xC3\xA0 desactivat \x2C i l\'element desactivat ara est\xC3\xA0 activat."
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Nota: un elemento abilitato chiamato \'${1}\' esiste gi\xC3\xA0\x2C quindi i due elementi sono stati scambiati: L\'elemento che prima era abilitato \xC3\xA8 ora disabilitato mentre l\'elemento precedentemente disabilitato \xC3\xA8 ora abilitato."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Note : un item nomm\xC3\xA9  \'${1}\'  existe d\xC3\xA9j\xC3\xA0\x2C les deux items ont donc \xC3\xA9t\xC3\xA9 \xC3\xA9chang\xC3\xA9. L\'actif est maintenant d\xC3\xA9sactiv\xC3\xA9\x2C le d\xC3\xA9sactiv\xC3\xA9 est maintenant actif."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Notiz: Das Element mit dem Namen \'${1}\' ist schon freigegeben\x2C daher wurden beide Elemente ausgetauscht: Das freigegebene Element ist jetzt deaktiviert und das vorhin deaktivierte ist jetzt freigegeben."
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Nota: un item activado denominado \'${1}\' ya existe\x2C como consecuencia el item anterior ahora estar\xC3\xA1 desactivado y se activar\xC3\xA1 el nuevo."
	#tag EndConstant

	#tag Constant, Name = kError, Type = String, Dynamic = True, Default = \"Error: \"${1}\"", Scope = Public
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Erreur.\"${1}\""
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Error: \xC2\xAB${1}\xC2\xBB"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Errore: \"${1}\""
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Fehler: \"${1}\""
	#tag EndConstant

	#tag Constant, Name = kErrorItemWithSameNameExists, Type = String, Dynamic = True, Default = \"The addon was not installed because a file or folder named \'${1}\' already exists in the destination folder. Please either remove the existing item\x2C disable the existing item\x2C or rename the item being installed.", Scope = Public
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"El complement no s\'ha insta\xC5\x80lat per qu\xC3\xA8 un fitxer o carpeta anomenada \'${1}\' ja existeix a la carpeta de destinaci\xC3\xB3. Esborreu l\'element ja existent\x2C desactiveu l\'element existent o canvieu el nom de l\'element insta\xC5\x80lat."
		#Tag Instance, Platform = Any, Language = it, Definition  = \"L\'addon non \xC3\xA8 stato installato perch\xC3\xA9 un file o una cartella chiamata \'${1}\' gi\xC3\xA0 esiste nella cartella di destinazione. Per favore rimuovi l\'elemento esistente\x2C disabilita l\'elemento o rinomina l\'elemento installato."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"L\'addon n\'a pas \xC3\xA9t\xC3\xA9 install\xC3\xA9 car un fichier ou le nom du dossier \'${1}\' existe d\xC3\xA9j\xC3\xA0 \xC3\xA0 l\'endroit indiqu\xC3\xA9. Essayer de d\xC3\xA9placer\x2C d\xC3\xA9sactiver ou renommer le fichier ou dossier existant."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Dieses Addon wurde nicht installiert weil eine Datei ofder ein Ordner mit dem Namen  \'${1}\' schon im Ziel Ordner vorhanden ist. Entfernen oder deaktivieren sie bitte das schon vorhandene Element oder geben sie dem Element das sie installieren wollen einen neuen Namen."
		#Tag Instance, Platform = Any, Language = es, Definition  = \"El addon no fue instalado porque un archivo o carpeta llamado \'${1}\' ya existe en la carpeta destino. Por favor\x2C remueve\x2C desactiva o renombra el item instalado actualmente."
	#tag EndConstant

	#tag Constant, Name = kErrorNotValidCompressedAircraftPackage, Type = String, Dynamic = True, Default = \"You did not select a compressed aircraft package.  Please try again.", Scope = Public
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"No heu seleccionat un paquet d\'avi\xC3\xB3 comprimit. Torneu-ho a provar."
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Non hai selezionato un archivio compresso dell\'aereo. Per favore riprova"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Vous n\'avez pas s\xC3\xA9lectionn\xC3\xA9 une archive contenant un avion. Recommencez SVP."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Sie haben kein komprimiertes Flugzeug Packet ausgew\xC3\xA4hlt. Bitte versuchen sie es erneut."
		#Tag Instance, Platform = Any, Language = es, Definition  = \"No has seleccionado un paquete de avi\xC3\xB3n comprimido. Por favor intenta de nuevo."
	#tag EndConstant

	#tag Constant, Name = kErrorNotValidCompressedCSLPackage, Type = String, Dynamic = True, Default = \"You did not select a compressed CSL.  Please try again.", Scope = Public
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Non hai selezionato un CSL compresso. Per favore prova ancora."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Vous devez s\xC3\xA9lectionner une archives de  CSL. recommencez SVP"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"No he seleccionat un CSL comprimit. Torneu a provar-ho."
	#tag EndConstant

	#tag Constant, Name = kErrorNotValidCompressedPluginPackage, Type = String, Dynamic = True, Default = \"You did not select a compressed plugin.  Please try again.", Scope = Public
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"No heu seleccionat un connector comprimit. Torneu-ho a provar."
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Non hai selezionato un archivio compresso del plugin. Per favore riprova."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Vous n\'avez pas s\xC3\xA9lectionn\xC3\xA9 une archive contenant un plugin. Recommencez SVP."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Sie haben kein komprimiertes PlugIn ausgew\xC3\xA4hlt. Bitte versuchen sie es erneut."
		#Tag Instance, Platform = Any, Language = es, Definition  = \"No has seleccionado un plugin comprimido. Por favor intenta de nuevo."
	#tag EndConstant

	#tag Constant, Name = kErrorNotValidCompressedSceneryPackage, Type = String, Dynamic = True, Default = \"You did not select a compressed scenery package.  Please try again.", Scope = Public
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"No heu seleccionat un paquet d\'escenari comprimit. Torneu-ho a provar."
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Non hai selezionato un archivio compresso dello scenario. Per favore riprova."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Vous n\'avez pas s\xC3\xA9lectionner une archive contenant une sc\xC3\xA8ne. Recommencez SVP."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Sie haben kein komprimiertes Scenery Packet ausgew\xC3\xA4hlt\x2C versuchen sie es bitte erneut."
		#Tag Instance, Platform = Any, Language = es, Definition  = \"No has seleccionado un paquete de escenario comprimido. Por favor\x2C intenta de nuevo."
	#tag EndConstant

	#tag Constant, Name = kExtractionFailed, Type = String, Dynamic = True, Default = \"Extraction of \"${1}\" failed: \"${2}\"", Scope = Public
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Extracci\xC3\xB3n de \"${1}\" fall\xC3\xB3: \"${2}\""
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"L\'extraction de \"{1}\" a \xC3\xA9chou\xC3\xA9e:\"{2}\""
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"L\'extracci\xC3\xB3 de \xC2\xAB${1}\xC2\xBB ha fallat: \xC2\xAB${2}\xC2\xBB"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Estrazione di \"${1}\" non riuscita: \"${2}\""
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Dekomprimieren von \"${1}\" ist mislungen: \"${2}\""
	#tag EndConstant

	#tag Constant, Name = kFilesRemain, Type = String, Dynamic = True, Default = \"${1} remain", Scope = Public
		#Tag Instance, Platform = Any, Language = es, Definition  = \"${1} restantes"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"${1} restant"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"en resten ${1}"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"${1} rimasti"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"${1} verbleiben"
	#tag EndConstant

	#tag Constant, Name = kGivingUp, Type = String, Dynamic = True, Default = \"Giving up.", Scope = Public
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Abandonando."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Abandon."
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Deixant-ho."
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Rinunciando."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Prozess wird aufgegeben."
	#tag EndConstant

	#tag Constant, Name = kGroup, Type = String, Dynamic = True, Default = \"Group:", Scope = Public
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Gruppo:"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Groupe:"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Grup:"
	#tag EndConstant

	#tag Constant, Name = kHTChooseXPlaneFolder, Type = String, Dynamic = True, Default = \"Choose a different X-Plane folder", Scope = Public
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Scegli una cartella di X-plane differente"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Choisissez un dossier d\'X-plane diff\xC3\xA9rent"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Trieu una altra carpeta de l\'X-Plane"
	#tag EndConstant

	#tag Constant, Name = kHTCreateGroup, Type = String, Dynamic = True, Default = \"Create a group for the current set of enabled and disabled addons", Scope = Public
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Crea un gruppo con il corrente set di addons abilitati e disabilitati"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Cr\xC3\xA9er un groupe avec les addons actullement activ\xC3\xA9s et d\xC3\xA9sactiv\xC3\xA9s"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Crea un grup pel conjunt de complements actualment activats i desactivats"
	#tag EndConstant

	#tag Constant, Name = kHTDelete, Type = String, Dynamic = True, Default = \"Delete the selected addon", Scope = Public
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Elimina l\'addon selezionato"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Effacer l\'addon s\xC3\xA9lectionn\xC3\xA9"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Suprimeix el complement seleccionat"
	#tag EndConstant

	#tag Constant, Name = kHTDeleteGroup, Type = String, Dynamic = True, Default = \"Delete the currently selected group (note this doesn\'t delete addons\x2C just the group)", Scope = Public
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Elimina il gruppo di addons selezionato (nota che questo non elimina gli addons ma solo il gruppo)"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Effacer le groupe s\xC3\xA9lectionn\xC3\xA9 (Notez que cel\xC3\xA0 n\'effacera que le groupe\x2C pas les addons)"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Suprimeix els grups seleccionats (aix\xC3\xB2 no suprimir\xC3\xA0 els complements\x2C nom\xC3\xA9s els grups)"
	#tag EndConstant

	#tag Constant, Name = kHTEnableAll, Type = String, Dynamic = True, Default = \"Enable or disable all addons at once", Scope = Public
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Abilita o disabilita tutti gli addons in una volta sola"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Activer ou d\xC3\xA9sactiver tous les addons"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Habilita o deshabilita tots els complements a la vegada"
	#tag EndConstant

	#tag Constant, Name = kHTInstall, Type = String, Dynamic = True, Default = \"Install an addon contained in a downloaded zip archive", Scope = Public
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Installa un addon contenuto in un archivio zip"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Installer un addon provenant d\'une archive zip"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Instal\xC2\xB7la un complement dins d\'un arxiu zip descarregat"
	#tag EndConstant

	#tag Constant, Name = kHTNewAircraftFolder, Type = String, Dynamic = True, Default = \"Create a new folder inside the currently selected one", Scope = Public
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Crea una nuona cartella dentro quella selezionata"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Cr\xC3\xA9er un nouveau dossier dans celui actuellemnt s\xC3\xA9lectionn\xC3\xA9"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Crea un carpeta dins de l\'actualment seleccionada"
	#tag EndConstant

	#tag Constant, Name = kHTSaveGroup, Type = String, Dynamic = True, Default = \"Save the current set of enabled and disabled addons into the selected group", Scope = Public
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Salva come gruppo il set corrente di addonsabilitati e disabilitati"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Enregistrer les r\xC3\xA9galges actuels pour les addons das nle groupe s\xC3\xA9lectionn\xC3\xA9"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Desa el conjunt de complements habilitats i deshabilitats dins del grup seleccionat"
	#tag EndConstant

	#tag Constant, Name = kHTSelectGroup, Type = String, Dynamic = True, Default = \"Select a group in the drop-down menu to enable and disable the addons for that group", Scope = Public
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Seleziona un gruppo dal menu a tendina e disabilita l\'addon per quel gruppo"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"S\xC3\xA9lectionnez un groupe pour activer ou d\xC3\xA9sactiver les addons pour ce groupe"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Trieu un grup al men\xC3\xBA desplegable per habilitar i deshabilitar els complements per aquest grup"
	#tag EndConstant

	#tag Constant, Name = kHTXPlaneFolder, Type = String, Dynamic = True, Default = \"The currently active X-Plane folder", Scope = Public
		#Tag Instance, Platform = Any, Language = it, Definition  = \"La cartella di X-Plane corrente"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Dossier actuel d\'X-Plane"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"La carpeta actualment activa de l\'X-Plane"
	#tag EndConstant

	#tag Constant, Name = kInstallComplete, Type = String, Dynamic = True, Default = \"Your OpenSceneryX installation is now Complete.", Scope = Public
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Su instalaci\xC3\xB3n de XAddonManager ya fue Completada."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Votre installation OpenSceneryX est compl\xC3\xA8te."
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"S\'ha completat la insta\xC5\x80laci\xC3\xB3 del vostre OpenSceneryX."
		#Tag Instance, Platform = Any, Language = it, Definition  = \"L\'installazione di OpenSceneryX \xC3\xA8 stata completata."
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Ihre OpenSceneryX Installation ist jetzt komplett."
	#tag EndConstant

	#tag Constant, Name = kListAircraft, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kListCSLs, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kListCustomSceneryPackages, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kListPlugins, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kLocateSceneryPackagePrompt, Type = String, Dynamic = True, Default = \"Locate the scenery package to install\x2C usually a zip file you have downloaded.", Scope = Public
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Localitzeu el paquet d\'escenari a insta\xC5\x80lar\x2C normalment un fitxer zip que heu descarregat."
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Localizzate lo scenario da installare\x2C di solito un file zip che avete scaricato."
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Indiquez la sc\xC3\xA8ne \xC3\xA0 installer\x2C habituellement un zip que vous avez t\xC3\xA9l\xC3\xA9charg\xC3\xA9"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Orten sie bitten das Packet dass sie installieren wollen\x2C \xC3\xBCblicherweise eine von ihnen aus denm netz geladene zip Datei."
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Selecciona el paquete de escenario a instalar\x2C habitualmente un archivo zip que has descargado."
	#tag EndConstant

	#tag Constant, Name = kLocateSceneryPackageTitle, Type = String, Dynamic = True, Default = \"Locate the scenery package you wish to install", Scope = Public
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Localitzeu el paquet d\'escenari que voleu insta\xC5\x80lar"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Localizzate lo scenario che vorresti installare"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Indiquez la sc\xC3\xA8ne que vous souhait\xC3\xA9 isntaller"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Orten sie bitte das Scenery Packet dass sie installieren m\xC3\xB6chten"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Encuentra el paquete de escenario que quieres instalar."
	#tag EndConstant

	#tag Constant, Name = kModified, Type = String, Dynamic = True, Default = \"(modified)", Scope = Public
		#Tag Instance, Platform = Any, Language = it, Definition  = \"(modificato)"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"(modifi\xC3\xA9)"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"(modificat)"
	#tag EndConstant

	#tag Constant, Name = kNewAircraftFolderPrompt, Type = String, Dynamic = True, Default = \"New Folder\xE2\x80\xA6", Scope = Public
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Nuova Cartella"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Nouveau dossier..."
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Carpeta nova..."
	#tag EndConstant

	#tag Constant, Name = kNoCurrentGroup, Type = String, Dynamic = True, Default = \"No Current Addon Group", Scope = Public
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Nessun gruppo di addon"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Pas de groupe d\'addon"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Sense grup de complements"
	#tag EndConstant

	#tag Constant, Name = kSceneryPackageKey1, Type = String, Dynamic = True, Default = \"L - Library\rES - Earth Scenery", Scope = Public
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"L - Biblioteca\rES - Escenari de la Terra"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"L - Libreria\rES - Scenario Mondiale"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"L - Librairie\rES - Sc\xC3\xA8nes (Terre)"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"L - Librer\xC3\xADa\rET - Escenario Tierra"
	#tag EndConstant

	#tag Constant, Name = kSceneryPackageKey2, Type = String, Dynamic = True, Default = \"MS - Mars Scenery\rEA - Earth Airports", Scope = Public
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"MS - Escenari de Mart\rEA - Aeroports de la Terra"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"MS - Scenario di Marte\rEA - Aeroporti mondiali"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"MS - Sc\xC3\xA8nes Martiennes\rEA - A\xC3\xA9roport (Terre)"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"EM - Escenario Marte\rAT - Aeropuertos Tierra"
	#tag EndConstant

	#tag Constant, Name = kSceneryPackageKey3, Type = String, Dynamic = True, Default = \"MA - Mars Airports", Scope = Public
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"MA - Aeroports de Mart"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"MA - Aeroporti di Marte"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"MA - A\xC3\xA9roports Martiens"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"AM - Aeropuertos Marte"
	#tag EndConstant

	#tag Constant, Name = kSeparator, Type = String, Dynamic = False, Default = \"----", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kSet, Type = String, Dynamic = True, Default = \"Set\xE2\x80\xA6", Scope = Public
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Setear\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"R\xC3\xA9glages\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Tria\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Seleziona\xE2\x80\xA6"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Einstellen\xE2\x80\xA6"
	#tag EndConstant

	#tag Constant, Name = kTabTitleAircraft, Type = String, Dynamic = True, Default = \"Aircraft", Scope = Public
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Avi\xC3\xB3"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Aerei"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Avions"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Flugzeuge"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Aviones"
	#tag EndConstant

	#tag Constant, Name = kTabTitleCSLs, Type = String, Dynamic = True, Default = \"CSLs", Scope = Public
		#Tag Instance, Platform = Any, Language = it, Definition  = \"CSL"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"CSLs"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"CSLs"
	#tag EndConstant

	#tag Constant, Name = kTabTitleCustomSceneryPackages, Type = String, Dynamic = True, Default = \"Custom Scenery Packages", Scope = Public
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Paquets d\'Escenari Personalitzats"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Pacchetti Custom Scenery"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Sc\xC3\xA8nes additionnelles"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Custom Scenery Packete"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Escenarios personalizados"
	#tag EndConstant

	#tag Constant, Name = kTabTitlePlugins, Type = String, Dynamic = True, Default = \"Plugins", Scope = Public
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Connector"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Plugins"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Plugins"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"Plugins"
	#tag EndConstant

	#tag Constant, Name = kXPlaneFolder, Type = String, Dynamic = True, Default = \"X-Plane\xC2\xAE Folder:", Scope = Public
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Carpeta X-Plane\xC2\xAE:"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Dossier X-Plane\xC2\xAE:"
		#Tag Instance, Platform = Any, Language = ca, Definition  = \"Carpeta X-Plane\xC2\xAE:"
		#Tag Instance, Platform = Any, Language = it, Definition  = \"Cartella di X-Plane\xC2\xAE:"
		#Tag Instance, Platform = Any, Language = de, Definition  = \"X-Plane\xC2\xAE Ordner:"
	#tag EndConstant


#tag EndWindowCode

#tag Events btnAddScenery
	#tag Event
		Sub Action()
		  'wndInstallSceneryPackage.show
		  addSceneryPackage
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lstCustomSceneryPackages
	#tag Event
		Sub Open()
		  me.heading(0) = kColumnTitleName
		  me.heading(1) = kColumnTitleLibrary
		  me.heading(2) = kColumnTitleEarthScenery
		  me.heading(3) = kColumnTitleMarsScenery
		  me.heading(4) = kColumnTitleEarthAirportData
		  me.heading(5) = kColumnTitleMarsAirportData
		  me.heading(6) = kColumnTitleShownOnMap
		  
		  me.columnType(6) = ListBox.TypeCheckBox
		  
		  me.heading(me.columnCount - 1) = kColumnTitleEnabled
		  me.columnType(me.columnCount - 1) = ListBox.TypeCheckBox
		  
		  me.sortedColumn = 0
		  me.columnSortDirection(0) = 1
		  
		  dim i as integer
		  for i = 1 to me.columnCount - 1
		    me.columnAlignment(i) = ListBox.AlignCenter
		  next
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  if (pTriggerChangeEvents) then
		    btnDeleteScenery.enabled = (me.selCount > 0)
		    plotPackages(pMap.graphics, cnvMap, 1)
		    plotPackages(pZoomedMap.graphics, cnvZoom, App.kMapZoomFactor)
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Sub CellAction(row As Integer, column As Integer)
		  dim customSceneryPackage as CustomSceneryPackage = me.cellTag(row, 0)
		  
		  if column = me.columnCount - 1 then
		    // Enable / disable
		    customSceneryPackage.enable(me.cellCheck(row, column))
		  elseif column = 6 then
		    // Show / Hide
		    customSceneryPackage.shownOnMap(me.cellCheck(row, column))
		  end if
		  
		  // Any change to enabled addons sets the dirty flag
		  if (pCurrentGroup <> nil) then pCurrentGroup.pDirty = true
		  
		  refreshGroupControls()
		  
		  plotPackages(pMap.graphics, cnvMap, 1)
		  plotPackages(pZoomedMap.graphics, cnvZoom, App.kMapZoomFactor)
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub DoubleClick()
		  Addon(me.cellTag(me.listIndex, 0)).doubleClicked()
		End Sub
	#tag EndEvent
	#tag Event
		Function CompareRows(row1 as Integer, row2 as Integer, column as Integer, ByRef result as Integer) As Boolean
		  if column = 0 then
		    return underscoreSensitiveCompare(me.cell(row1, column), me.cell(row2, column), result)
		  else
		    return false
		  end if
		End Function
	#tag EndEvent
	#tag Event
		Sub ExpandRow(row As Integer)
		  me.MouseCursor= System.Cursors.Wait
		  
		  dim addOn as AddOn = me.CellTag(row, 0)
		  addOn.expandListBoxEntry(lstCustomSceneryPackages, row)
		  
		  me.MouseCursor= System.Cursors.StandardPointer
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  'if 1=(row+column) mod 2 then
		  'g.foreColor=rgb(255,0,0)
		  'else
		  'g.foreColor=rgb(0,0,0)
		  'end
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events btnDeleteScenery
	#tag Event
		Sub Action()
		  deleteSceneryPackage()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnDeleteAircraft
	#tag Event
		Sub Action()
		  // Store the selected index before the delete
		  dim selectedIndex as integer = lstAircraft.listIndex
		  
		  deleteAircraft()
		  
		  // Find the containing listbox line
		  dim i as integer
		  for i = lstAircraft.listIndex - 1 downto 1
		    if lstAircraft.cellTag(i, 0) isa AircraftFolder then
		      // Collapse and expand the row to refresh its contents
		      lstAircraft.expanded(i) = false
		      lstAircraft.refresh()
		      lstAircraft.expanded(i) = true
		      return
		    end if
		  next
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnAddPlugin
	#tag Event
		Sub Action()
		  addPlugin()
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lstPlugins
	#tag Event
		Sub CellAction(row As Integer, column As Integer)
		  dim plugin as Plugin = me.cellTag(row, 0)
		  plugin.enable(me.cellCheck(row, me.columnCount - 1))
		  
		  // Any change to enabled addons sets the dirty flag
		  if (pCurrentGroup <> nil) then pCurrentGroup.pDirty = true
		  
		  refreshGroupControls()
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  if (pTriggerChangeEvents) then
		    btnDeletePlugin.enabled = (me.selCount > 0)
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  me.heading(0) = kColumnTitleName
		  
		  me.heading(me.columnCount - 1) = kColumnTitleEnabled
		  me.columnType(me.columnCount - 1) = ListBox.TypeCheckBox
		  
		  me.sortedColumn = 0
		  me.columnSortDirection(0) = 1
		  
		  dim i as integer
		  for i = 1 to me.columnCount - 1
		    me.columnAlignment(i) = ListBox.AlignCenter
		  next
		End Sub
	#tag EndEvent
	#tag Event
		Sub DoubleClick()
		  Addon(me.cellTag(me.listIndex, 0)).doubleClicked()
		End Sub
	#tag EndEvent
	#tag Event
		Function CompareRows(row1 as Integer, row2 as Integer, column as Integer, ByRef result as Integer) As Boolean
		  if column = 0 then
		    return underscoreSensitiveCompare(me.cell(row1, column), me.cell(row2, column), result)
		  else
		    return false
		  end if
		End Function
	#tag EndEvent
	#tag Event
		Sub ExpandRow(row As Integer)
		  me.MouseCursor= System.Cursors.Wait
		  
		  dim addOn as AddOn = me.CellTag(row, 0)
		  addOn.expandListBoxEntry(lstPlugins, row)
		  
		  me.MouseCursor= System.Cursors.StandardPointer
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnDeletePlugin
	#tag Event
		Sub Action()
		  deletePlugin()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chkEnableAllPlugins
	#tag Event
		Sub Action()
		  // pTriggerAction is in the ExtendedCheckBox superclass and enables us to stop the action firing if checkbox is set programmatically
		  if (me.pTriggerAction) then
		    enableAll(kListPlugins, me.value)
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cnvMap
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  selectNearestPackage(x, y)
		  return false
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  dim customSceneryPackage as CustomSceneryPackage
		  customSceneryPackage = getPackageUnderCursor(x, y)
		  
		  moveZoom(x, y)
		  
		  if (customSceneryPackage <> nil) then
		    fldTooltip.text = customSceneryPackage.pName
		    fldTooltip.visible = true
		  else
		    fldTooltip.visible = false
		  end if
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  fldTooltip.visible = false
		  cnvZoom.visible = false
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  cnvZoom.visible = true
		End Sub
	#tag EndEvent
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  // Copy the off-screen image to the map canvas.
		  g.drawPicture(pMap, 0, 0, me.width, me.height, 0, 0, pMap.width, pMap.height)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events chkEnableAllCustomSceneryPackages
	#tag Event
		Sub Action()
		  // pTriggerAction is in the ExtendedCheckBox superclass and enables us to stop the action firing if checkbox is set programmatically
		  if (me.pTriggerAction) then
		    enableAll(kListCustomSceneryPackages, me.value)
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lstAircraft
	#tag Event
		Sub DoubleClick()
		  Addon(me.cellTag(me.listIndex, 0)).doubleClicked()
		  me.expanded(me.listindex) = not me.expanded(me.listindex)
		End Sub
	#tag EndEvent
	#tag Event
		Sub ExpandRow(row As Integer)
		  me.MouseCursor= System.Cursors.Wait
		  
		  dim addOn as AddOn = me.CellTag(row, 0)
		  addOn.expandListBoxEntry(lstAircraft, row)
		  
		  me.MouseCursor= System.Cursors.StandardPointer
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  me.heading(0) = kColumnTitleName
		  me.heading(1) = kColumnTitle3dCockpit
		  me.heading(2) = kColumnTitleAirfoils
		  me.heading(3) = kColumnTitleSounds
		  me.heading(4) = kColumnTitleWeapons
		  me.heading(5) = kColumnTitlePlugins
		  me.heading(6) = kColumnTitleGoodway
		  
		  me.sortedColumn = 0
		  me.columnSortDirection(0) = 1
		  
		  dim i as integer
		  for i = 1 to me.columnCount - 1
		    me.columnAlignment(i) = ListBox.AlignCenter
		  next
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  if (pTriggerChangeEvents) then
		    btnDeleteAircraft.enabled = me.listIndex > -1 and me.cellTag(me.listIndex, 0) isa Aircraft
		    btnAddAircraft.enabled = me.listIndex > -1 and me.cellTag(me.listIndex, 0) isa AircraftFolder
		    btnNewAircraftFolder.enabled = me.listIndex > -1 and me.cellTag(me.listIndex, 0) isa AircraftFolder
		    refreshAircraftDisplay()
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Function CompareRows(row1 as Integer, row2 as Integer, column as Integer, ByRef result as Integer) As Boolean
		  if column = 0 then
		    return underscoreSensitiveCompare(me.cell(row1, column), me.cell(row2, column), result)
		  else
		    return false
		  end if
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events grpAircraftKey
	#tag Event
		Sub Open()
		  #if TargetWin32 or TargetLinux
		    me.top = me.top - 5
		    me.height = me.height + 5
		  #endif
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events txtAircraftKey1
	#tag Event
		Sub Open()
		  #if TargetWin32
		    me.top = me.top + 5
		  #endif
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events txtAircraftKey2
	#tag Event
		Sub Open()
		  #if TargetWin32
		    me.top = me.top + 5
		  #endif
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events txtAircraftKey3
	#tag Event
		Sub Open()
		  #if TargetWin32
		    me.top = me.top + 5
		  #endif
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events grpCustomSceneryKey
	#tag Event
		Sub Open()
		  #if TargetWin32 or TargetLinux
		    me.top = me.top - 5
		    me.height = me.height + 5
		  #endif
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events txtCustomSceneryKey1
	#tag Event
		Sub Open()
		  #if TargetWin32
		    me.top = me.top + 5
		  #endif
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events txtCustomSceneryKey2
	#tag Event
		Sub Open()
		  #if TargetWin32
		    me.top = me.top + 5
		  #endif
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events txtCustomSceneryKey3
	#tag Event
		Sub Open()
		  #if TargetWin32
		    me.top = me.top + 5
		  #endif
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnAddAircraft
	#tag Event
		Sub Action()
		  addAircraft()
		  
		  // Collapse and expand the row to refresh its contents
		  lstAircraft.expanded(lstAircraft.listIndex) = false
		  lstAircraft.refresh()
		  lstAircraft.expanded(lstAircraft.listIndex) = true
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lstCSLs
	#tag Event
		Sub CellAction(row As Integer, column As Integer)
		  dim csl as CSL = me.cellTag(row, 0)
		  csl.enable(me.cellCheck(row, me.columnCount - 1))
		  
		  // Any change to enabled addons sets the dirty flag
		  if (pCurrentGroup <> nil) then pCurrentGroup.pDirty = true
		  
		  refreshGroupControls()
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  if (pTriggerChangeEvents) then
		    btnDeleteCSL.enabled = (me.selCount > 0)
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  me.heading(0) = kColumnTitleName
		  
		  me.heading(me.columnCount - 1) = kColumnTitleEnabled
		  me.columnType(me.columnCount - 1) = ListBox.TypeCheckBox
		  
		  me.sortedColumn = 0
		  me.columnSortDirection(0) = 1
		  
		  dim i as integer
		  for i = 1 to me.columnCount - 1
		    me.columnAlignment(i) = ListBox.AlignCenter
		  next
		End Sub
	#tag EndEvent
	#tag Event
		Sub DoubleClick()
		  Addon(me.cellTag(me.listIndex, 0)).doubleClicked()
		End Sub
	#tag EndEvent
	#tag Event
		Function CompareRows(row1 as Integer, row2 as Integer, column as Integer, ByRef result as Integer) As Boolean
		  if column = 0 then
		    return underscoreSensitiveCompare(me.cell(row1, column), me.cell(row2, column), result)
		  else
		    return false
		  end if
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events chkEnableAllCSLs
	#tag Event
		Sub Action()
		  // pTriggerAction is in the ExtendedCheckBox superclass and enables us to stop the action firing if checkbox is set programmatically
		  if (me.pTriggerAction) then
		    enableAll(kListCSLs, me.value)
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnAddCSL
	#tag Event
		Sub Action()
		  addCSL()
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnDeleteCSL
	#tag Event
		Sub Action()
		  deleteCSL()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnNewAircraftFolder
	#tag Event
		Sub Action()
		  wndCreateFolder.show()
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cnvLogo
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  showURL(App.kURLWebsite)
		End Function
	#tag EndEvent
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  g.DrawPicture(imgIcon, 0, 0, imgIcon.Width * 0.5, imgIcon.Height * 0.5, 0, 0, imgIcon.Width, imgIcon.Height)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnSetXPlaneFolder
	#tag Event
		Sub Action()
		  if (App.requestXPlaneFolder(false)) then
		    displayXPlaneFolder()
		    scanXPlaneFolder()
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events tmrMapRefresh
	#tag Event
		Sub Action()
		  // Do nothing if there is no selected package
		  if lstCustomSceneryPackages.listIndex < 0 then return
		  
		  // Do nothing if we're not on the scenery tab
		  if tpnlMain.value <> 0 then return
		  
		  dim selectedPackage as CustomSceneryPackage = lstCustomSceneryPackages.cellTag(lstCustomSceneryPackages.listIndex, 0)
		  selectedPackage.cycleDrawColour()
		  
		  selectedPackage.plotOnMap(pMap.graphics, cnvMap, CustomSceneryPackage.kPlanetEarth, true, 1)
		  selectedPackage.plotOnMap(pZoomedMap.graphics, cnvZoom, CustomSceneryPackage.kPlanetEarth, true, App.kMapZoomFactor)
		  
		  // Refresh the map and zoomed area
		  cnvZoom.invalidate(false)
		  cnvMap.invalidate(false)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events sckVersionChecker
	#tag Event
		Sub PageReceived(url as string, httpStatus as integer, headers as internetHeaders, content as string)
		  if (httpStatus = 200) then App.checkVersion(content)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cnvZoom
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  dim normalizedMouseX as integer = cnvMap.mouseX - cnvMap.left
		  dim normalizedMouseY as integer = cnvMap.mouseY - cnvMap.top
		  
		  // Bound the mouse location within a rectangle that is inset from the map area by half the dimensions of the zoom area (scaled by zoom factor)
		  dim xOffset as integer = min(max(normalizedMouseX, me.width / (2 * App.kMapZoomFactor) + 1), cnvMap.width - me.width / (2 * App.kMapZoomFactor))
		  dim yOffset as integer = min(max(normalizedMouseY, me.height / (2 * App.kMapZoomFactor) + 1), cnvMap.height - me.height / (2 * App.kMapZoomFactor))
		  
		  // Copy the appropriate portion of the off-screen image to the zoom canvas.  We are working from the *bounded mouse loc* so we need to
		  // offset this by 1/2 the dimensions of the zoom draw area, to compensate for the cursor being in the middle of the zoom area
		  g.drawPicture(pZoomedMap, 0, 0, me.width, me.height, xOffset * App.kMapZoomFactor - me.width / 2, yOffset * App.kMapZoomFactor - me.height / 2, me.width, me.height)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnSaveGroup
	#tag Event
		Sub Action()
		  saveGroup()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnDeleteGroup
	#tag Event
		Sub Action()
		  // First item is 'No Current Group', second item is separator
		  if (popGroups.listIndex < 2) then return
		  
		  dim selectedGroup as Group = popGroups.rowTag(popGroups.listIndex)
		  dim parameters() as string = array(selectedGroup.pName)
		  
		  if (App.displayMessage(App.processParameterizedString(kConfirmDeleteGroup, parameters), "", MessageDialog.GraphicCaution, App.kDontDelete, App.kDelete, "", wndMain)) = 2 then deleteCurrentGroup()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnAddGroup
	#tag Event
		Sub Action()
		  wndCreateGroup.show()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events popGroups
	#tag Event
		Sub Change()
		  groupSelected()
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events tmrCheckAirportFolderParsed
	#tag Event
		Sub Action()
		  btnAddScenery.enabled = not (App.pXPlaneFolder.pAirportData = nil)
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
		Name="pTriggerChangeEvents"
		Group="Behavior"
		InitialValue="true"
		Type="boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="pZoomedMap"
		Group="Behavior"
		Type="Picture"
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
