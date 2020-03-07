#include "script_component.hpp"

params ["_display"];

// Slots
private _uniformSlot = _display displayCtrl IDC_FG_UNIFORM_TAB;
private _vestSlot = _display displayCtrl IDC_FG_VEST_TAB;
private _backpackSlot = _display displayCtrl IDC_FG_BACKPACK_TAB;

private _headgearSlot = _display displayCtrl IDC_FG_HEADGEAR;
private _glassesSlot = _display displayCtrl IDC_FG_GOGGLES;
private _hmdSlot = _display displayCtrl IDC_FG_HMD;
private _binocularSlot = _display displayCtrl IDC_FG_BINOC;

private _rifleSlot = _display displayCtrl IDC_FG_PRIMARY;
private _rifleSilencerSlot = _display displayCtrl IDC_FG_PW_MUZZLE;
private _rifleBipodSlot = _display displayCtrl IDC_FG_PW_UNDERBARREL;
private _rifleOpticSlot = _display displayCtrl IDC_FG_PW_OPTICS;
private _riflePointerSlot = _display displayCtrl IDC_FG_PW_FLASHLIGHT;
private _rifleMagazine2Slot = _display displayCtrl IDC_FG_PW_MAGAZINE_GL;
private _rifleMagazineSlot = _display displayCtrl IDC_FG_PW_MAGAZINE;

private _launcherSlot = _display displayCtrl IDC_FG_SECONDARY;
private _launcherSilencerSlot = _display displayCtrl IDC_FG_SW_MUZZLE;
private _launcherBipodSlot = _display displayCtrl IDC_FG_SW_UNDERBARREL;
private _launcherOpticSlot = _display displayCtrl IDC_FG_SW_OPTICS;
private _launcherPointerSlot = _display displayCtrl IDC_FG_SW_FLASHLIGHT;
private _launcherMagazineSlot = _display displayCtrl IDC_FG_SW_MAGAZINE;

private _pistolSlot = _display displayCtrl IDC_FG_HANDGUN;
private _pistolSilencerSlot = _display displayCtrl IDC_FG_HG_MUZZLE;
private _pistolBipodSlot = _display displayCtrl IDC_FG_HG_UNDERBARREL;
private _pistolOpticSlot = _display displayCtrl IDC_FG_HG_OPTICS;
private _pistolPointerSlot = _display displayCtrl IDC_FG_HG_FLASHLIGHT;
private _pistolMagazineSlot = _display displayCtrl IDC_FG_HG_MAGAZINE;

private _mapSlot = _display displayCtrl IDC_FG_MAP;
private _gpsSlot = _display displayCtrl IDC_FG_GPS;
private _radioSlot = _display displayCtrl IDC_FG_RADIO;
private _compassSlot = _display displayCtrl IDC_FG_COMPASS;
private _watchSlot = _display displayCtrl IDC_FG_WATCH;

_uniformSlot setVariable [QGVAR(slotType), "UNIFORM"];
_vestSlot setVariable [QGVAR(slotType), "VEST"];
_backpackSlot setVariable [QGVAR(slotType), "BACKPACK"];

_headgearSlot setVariable [QGVAR(slotType), "HEADGEAR"];
_glassesSlot setVariable [QGVAR(slotType), "GOGGLES"];
_hmdSlot setVariable [QGVAR(slotType), "HMD"];
_binocularSlot setVariable [QGVAR(slotType), "BINOCULAR"];

_rifleSlot setVariable [QGVAR(slotType), "RIFLE"];
_rifleSilencerSlot setVariable [QGVAR(slotType), "RIFLE_SILENCER"];
_rifleBipodSlot setVariable [QGVAR(slotType), "RIFLE_BIPOD"];
_rifleOpticSlot setVariable [QGVAR(slotType), "RIFLE_OPTIC"];
_riflePointerSlot setVariable [QGVAR(slotType), "RIFLE_POINTER"];
_rifleMagazine2Slot setVariable [QGVAR(slotType), "RIFLE_MAGAZINE"];
_rifleMagazineSlot setVariable [QGVAR(slotType), "RIFLE_MAGAZINE"];

_launcherSlot setVariable [QGVAR(slotType), "LAUNCHER"];
_launcherSilencerSlot setVariable [QGVAR(slotType), "LAUNCHER_SILENCER"];
_launcherBipodSlot setVariable [QGVAR(slotType), "LAUNCHER_BIPOD"];
_launcherOpticSlot setVariable [QGVAR(slotType), "LAUNCHER_OPTIC"];
_launcherPointerSlot setVariable [QGVAR(slotType), "LAUNCHER_POINTER"];
_launcherMagazineSlot setVariable [QGVAR(slotType), "LAUNCHER_MAGAZINE"];

_pistolSlot setVariable [QGVAR(slotType), "PISTOL"];
_pistolSilencerSlot setVariable [QGVAR(slotType), "PISTOL_SILENCER"];
_pistolBipodSlot setVariable [QGVAR(slotType), "PISTOL_BIPOD"];
_pistolOpticSlot setVariable [QGVAR(slotType), "PISTOL_OPTIC"];
_pistolPointerSlot setVariable [QGVAR(slotType), "PISTOL_POINTER"];
_pistolMagazineSlot setVariable [QGVAR(slotType), "PISTOL_MAGAZINE"];

_mapSlot setVariable [QGVAR(slotType), "ASSIGNED_ITEM"];
_gpsSlot setVariable [QGVAR(slotType), "ASSIGNED_ITEM"];
_radioSlot setVariable [QGVAR(slotType), "ASSIGNED_ITEM"];
_compassSlot setVariable [QGVAR(slotType), "ASSIGNED_ITEM"];
_watchSlot setVariable [QGVAR(slotType), "ASSIGNED_ITEM"];

{
    _x ctrlAddEventHandler ["MouseButtonDblClick", {
        params ["_control", "_button"];
        if (_button != 0) exitWith {}; // LMB only
        private _unit = call CBA_fnc_currentUnit;

        private _classname = "";
        private _slotType = _control getVariable QGVAR(slotType);
        switch _slotType do {
            // containers
            case "UNIFORM": {
                _classname = uniform _unit;
            };
            case "VEST": {
                _classname = vest _unit;
            };
            case "BACKPACK": {
                _classname = backpack _unit;
            };

            // gear
            case "HEADGEAR": {
                _classname = headgear _unit;
            };
            case "GOGGLES": {
                _classname = goggles _unit;
            };
            case "HMD": {
                _classname = hmd _unit;
            };
            case "BINOCULAR": {
                _classname = binocular _unit;
            };

            // rifle
            case "RIFLE": {
                _classname = primaryWeapon _unit;
            };
            case "RIFLE_SILENCER": {
                _classname = primaryWeaponItems _unit select 0;
            };
            case "RIFLE_BIPOD": {
                _classname = primaryWeaponItems _unit select 3;
            };
            case "RIFLE_OPTIC": {
                _classname = primaryWeaponItems _unit select 1;
            };
            case "RIFLE_POINTER": {
                _classname = primaryWeaponItems _unit select 2;
            };
            case "RIFLE_MAGAZINE": {
                _classname = primaryWeaponMagazine _unit select 0; //@todo
            };

            // launcher
            case "LAUNCHER": {
                _classname = secondaryWeapon _unit;
            };
            case "LAUNCHER_SILENCER": {
                _classname = secondaryWeaponItems _unit select 0;
            };
            case "LAUNCHER_BIPOD": {
                _classname = secondaryWeaponItems _unit select 3;
            };
            case "LAUNCHER_OPTIC": {
                _classname = secondaryWeaponItems _unit select 1;
            };
            case "LAUNCHER_POINTER": {
                _classname = secondaryWeaponItems _unit select 2;
            };
            case "LAUNCHER_MAGAZINE": {
                _classname = secondaryWeaponMagazine _unit select 0;
            };

            // pistol
            case "PISTOL": {
                _classname = handgunWeapon _unit;
            };
            case "PISTOL_SILENCER": {
                _classname = handgunItems _unit select 0;
            };
            case "PISTOL_BIPOD": {
                _classname = handgunItems _unit select 3;
            };
            case "PISTOL_OPTIC": {
                _classname = handgunItems _unit select 1;
            };
            case "PISTOL_POINTER": {
                _classname = handgunItems _unit select 2;
            };
            case "PISTOL_MAGAZINE": {
                _classname = handgunMagazine _unit select 0;
            };

            // items
            case "ASSIGNED_ITEM": {
                _classname = "@TODO";
            };
        };

        [ctrlParent _control, _classname, _slotType] call FUNC(openItemContextMenu);
    }];
} forEach [
    _uniformSlot, _vestSlot, _backpackSlot,
    _headgearSlot, _glassesSlot, _hmdSlot, _binocularSlot,
    _rifleSlot, _rifleSilencerSlot, _rifleBipodSlot, _rifleOpticSlot, _riflePointerSlot, _rifleMagazine2Slot, _rifleMagazineSlot,
    _launcherSlot, _launcherSilencerSlot, _launcherBipodSlot, _launcherOpticSlot, _launcherPointerSlot, _launcherMagazineSlot,
    _pistolSlot, _pistolSilencerSlot, _pistolBipodSlot, _pistolOpticSlot, _pistolPointerSlot, _pistolMagazineSlot,
    _mapSlot, _gpsSlot, _radioSlot, _compassSlot, _watchSlot
];

// Containers
private _groundItems = _display displayCtrl IDC_FG_GROUND_ITEMS;
private _containerItems = _display displayCtrl IDC_FG_CHOSEN_CONTAINER;
private _uniformItems = _display displayCtrl IDC_FG_UNIFORM_CONTAINER;
private _vestItems = _display displayCtrl IDC_FG_VEST_CONTAINER;
private _backpackItems = _display displayCtrl IDC_FG_BACKPACK_CONTAINER;

_groundItems setVariable [QGVAR(containerType), "GROUND"];
_containerItems setVariable [QGVAR(containerType), "CONTAINER"];
_uniformItems setVariable [QGVAR(containerType), "UNIFORM_CONTAINER"];
_vestItems setVariable [QGVAR(containerType), "VEST_CONTAINER"];
_backpackItems setVariable [QGVAR(containerType), "BACKPACK_CONTAINER"];

private _fnc_selected = {
    params ["_control", "_index"];
    private _unit = call CBA_fnc_currentUnit;

    private _container = objNull;
    private _containerType = _control getVariable QGVAR(containerType);
    switch _containerType do {
        case "GROUND": {
            _container = GVAR(CurrentGroundItemHolder);
        };
        case "CONTAINER": {
            _container = GVAR(CurrentContainer);
        };
        case "UNIFORM_CONTAINER": {
            _container = uniformContainer _unit;
        };
        case "VEST_CONTAINER": {
            _container = vestContainer _unit;
        };
        case "BACKPACK_CONTAINER": {
            _container = backpackContainer _unit;
        };
    };

    // Reports classname, but only for magazines.
    private _classname = _control lbData _index;
    if (_classname isEqualTo "") then {
        // For weapons, items and glasses, use the display name to guess the classname.
        private _displayName = _control lbText _index;

        private _items = weaponCargo _container + itemCargo _container;
        private _index = _items findIf {
            _displayName isEqualTo getText (_x call CBA_fnc_getItemConfig >> "displayName");
        };

        _classname = _items param [_index, ""];
    };

    [ctrlParent _control, _classname, _containerType] call FUNC(openItemContextMenu);
};

_groundItems ctrlAddEventHandler ["lbDblClick", _fnc_selected];
_containerItems ctrlAddEventHandler ["lbDblClick", _fnc_selected];
_uniformItems ctrlAddEventHandler ["lbDblClick", _fnc_selected];
_vestItems ctrlAddEventHandler ["lbDblClick", _fnc_selected];
_backpackItems ctrlAddEventHandler ["lbDblClick", _fnc_selected];
