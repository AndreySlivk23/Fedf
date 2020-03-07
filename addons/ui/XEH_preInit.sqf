#include "script_component.hpp"

ADDON = false;

#include "initSettings.sqf"

if (hasInterface) then {
    call COMPILE_FILE(flexiMenu\init);

    // recreate after loading a savegame
    addMissionEventHandler ["Loaded", {
        if (!isNil QGVAR(ProgressBarParams)) then {
            QGVAR(ProgressBar) cutRsc [QGVAR(ProgressBar), "PLAIN"];
        };
    }];

    ["CAManBase", "InventoryOpened", {
        params ["_unit", "_container1", "_container2"];
        if (_unit != call CBA_fnc_currentUnit) exitWith {};

        if (isNull _container2) then {
            GVAR(CurrentGroundItemHolder) = _container1;
        } else {
            GVAR(CurrentContainer) = _container1;
            GVAR(CurrentGroundItemHolder) = _container2;
        };
    }] call CBA_fnc_addClassEventHandler;

    PREP(initDisplayInventory);
    PREP(openItemContextMenu);
};

// legacy function names
FUNC(Add) = CBA_fnc_flexiMenu_Add;
FUNC(Remove) = CBA_fnc_flexiMenu_Remove;
FUNC(setObjectMenuSource) = CBA_fnc_flexiMenu_setObjectMenuSource;
FUNC(openMenuByDef) = CBA_fnc_flexiMenu_openMenuByDef;
FUNC(keyDown) = CBA_fnc_flexiMenu_keyDown;
FUNC(keyUp) = CBA_fnc_flexiMenu_keyUp;
FUNC(menu) = CBA_fnc_flexiMenu_menu;
FUNC(list) = CBA_fnc_flexiMenu_list;
FUNC(getMenuDef) = CBA_fnc_flexiMenu_getMenuDef;
FUNC(getMenuOption) = CBA_fnc_flexiMenu_getMenuOption;
FUNC(menuShortcut) = CBA_fnc_flexiMenu_menuShortcut;
FUNC(mouseButtonDown) = CBA_fnc_flexiMenu_mouseButtonDown;
FUNC(highlightCaretKey) = CBA_fnc_flexiMenu_highlightCaretKey;
FUNC(execute) = CBA_fnc_flexiMenu_execute;

ADDON = true;
