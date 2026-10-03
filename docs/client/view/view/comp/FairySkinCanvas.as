// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.FairySkinCanvas

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Alert;
    import mx.containers.Canvas;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import flash.utils.Dictionary;
    import mx.core.mx_internal;
    import flash.net.Responder;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.config.Language;
    import mx.events.CloseEvent;
    import flash.events.Event;
    import mx.controls.Image;
    import mx.controls.Button;
    import com.qeedoo.ui.resource.ResManager;
    import flash.events.MouseEvent;
    import flash.events.*;
    import flash.display.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.text.*;
    import flash.media.*;
    import mx.binding.*;
    import flash.net.*;
    import flash.utils.*;
    import flash.system.*;
    import flash.accessibility.*;
    import flash.ui.*;
    import flash.filters.*;
    import flash.external.*;
    import flash.debugger.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.xml.*;

    use namespace mx_internal;

    public class FairySkinCanvas extends DragableCanvas implements IBindingClient 
    {

        private static const FAIRY_BACKGROUND:Class = FairySkinCanvas_FAIRY_BACKGROUND;
        private static const FAIRY_BINDED:Class = FairySkinCanvas_FAIRY_BINDED;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _fairyActive:int = 0;
        public var isLoadCharactorFairyFlag:Boolean = false;
        private var _id:int = 0;
        private var _fairyCount:int = 0;
        private var _alert:Alert;
        private var _647326148fairySkillTitle:BasicTitleCanvas;
        private var _p:DragableCanvas;
        private var _1699633811imageCanvas:Canvas;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":320,
                    "height":400,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"fairySkillTitle"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"imageCanvas",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":10,
                                "y":34,
                                "width":300,
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"auto",
                                "height":351
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var _fairyResList:Array = new Array();
        private var btnDict:Dictionary = new Dictionary();
        private var FAIRY_SKIN_NEED_ITEM:* = {
            "15":true,
            "16":true
        };
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function FairySkinCanvas()
        {
            mx_internal::_document = this;
            this.width = 320;
            this.height = 400;
            this.styleName = "StandardContent";
            this.cacheAsBitmap = true;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            FairySkinCanvas._watcherSetupUtil = _arg_1;
        }


        private function updateView():void
        {
            _core.remote.call("getFairyResAndList", new Responder(onGetFairyResAndList), null);
        }

        override public function initialize():void
        {
            var target:FairySkinCanvas;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _FairySkinCanvas_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_FairySkinCanvasWatcherSetupUtil");
                var _local_2:* = watcherSetupUtilClass;
                (_local_2["init"](null));
            };
            _watcherSetupUtil.setup(this, function (_arg_1:String):*
            {
                return (target[_arg_1]);
            }, bindings, watchers);
            var i:uint;
            while (i < bindings.length)
            {
                Binding(bindings[i]).execute();
                i++;
            };
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            super.initialize();
        }

        private function onGetFairyResAndList(_arg_1:Object):void
        {
            var _local_2:*;
            if (_arg_1)
            {
                isLoadCharactorFairyFlag = true;
                _id = _core.cid;
                for (_local_2 in _fairyResList)
                {
                    delete _fairyResList[_local_2];
                };
                if (_arg_1)
                {
                    if (_arg_1.actFairy)
                    {
                        _fairyActive = Number(_arg_1.actFairy);
                    };
                    if (_arg_1.actFairyList)
                    {
                        if (String(_arg_1.actFairyList).indexOf("|") >= 0)
                        {
                            _fairyResList = _arg_1.actFairyList.split("|");
                        }
                        else
                        {
                            _fairyResList.push(Number(_arg_1.actFairyList));
                        };
                    };
                };
                updateFairSkinView();
            };
        }

        [Bindable(event="propertyChange")]
        public function get imageCanvas():Canvas
        {
            return (this._1699633811imageCanvas);
        }

        private function initSkinPanelView():void
        {
            if (checkPanelView())
            {
                updateFairSkinView();
            };
        }

        private function checkPanelView():Boolean
        {
            var _local_3:*;
            var _local_1:Array = GameData.d[GamePredef.TBL_FAIRY_TEMPALTE];
            if (!_local_1)
            {
                return (false);
            };
            var _local_2:* = 0;
            for (_local_3 in _local_1)
            {
                if (_local_1[_local_3])
                {
                    _local_2++;
                };
            };
            if (_fairyCount == _local_2)
            {
                return (false);
            };
            return (true);
        }

        public function set imageCanvas(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1699633811imageCanvas;
            if (_local_2 !== _arg_1)
            {
                this._1699633811imageCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imageCanvas", _local_2, _arg_1));
            };
        }

        public function onSetFairyRes(_arg_1:Object):void
        {
            if (_arg_1)
            {
                if (_arg_1.type == 2)
                {
                    if ((((!(_fairyActive == 0)) && (btnDict[("btn" + _fairyActive)])) && (btnDict[("btn" + _fairyActive)].label)))
                    {
                        btnDict[("btn" + _fairyActive)].label = Language.FAIRY_MANAGER_PANEL_U[91];
                    };
                    _fairyActive = Number(_arg_1.tid);
                    if (((btnDict[("btn" + _fairyActive)]) && (btnDict[("btn" + _fairyActive)].label)))
                    {
                        btnDict[("btn" + _fairyActive)].label = Language.FAIRY_MANAGER_PANEL_U[90];
                    };
                }
                else
                {
                    if (_arg_1.type == 1)
                    {
                        if (((btnDict[("btn" + _fairyActive)]) && (btnDict[("btn" + _fairyActive)].label)))
                        {
                            btnDict[("btn" + _fairyActive)].label = Language.FAIRY_MANAGER_PANEL_U[91];
                        };
                        _fairyActive = null;
                    };
                };
            };
        }

        public function follow(_arg_1:DragableCanvas):void
        {
            _p = _arg_1;
            this.x = (_arg_1.x + _arg_1.width);
            this.y = _arg_1.y;
            if (this.visible)
            {
                _arg_1.addEventListener(DragableCanvas.EVENT_MOVE, onMove);
            };
        }

        public function clickBtn(event:Event):void
        {
            var tid:int;
            var func:Function;
            var showtext:* = undefined;
            tid = Number(event.currentTarget.name);
            if (tid == _fairyActive)
            {
                if (!checkThisFairyDress(tid))
                {
                    updateView();
                    return;
                };
                _core.remote.call("setFairyRes", new Responder(onSetFairyRes), tid, 1);
            }
            else
            {
                if (((checkThisFairyDress(tid)) && (event.currentTarget.label == Language.FAIRY_MANAGER_PANEL_U[91])))
                {
                    _core.remote.call("setFairyRes", new Responder(onSetFairyRes), tid, 2);
                }
                else
                {
                    if (((!(checkThisFairyDress(tid))) && (event.currentTarget.label == Language.FAIRY_MANAGER_PANEL_U[92])))
                    {
                        func = function (_arg_1:CloseEvent):void
                        {
                            if (_arg_1.detail == Alert.YES)
                            {
                                _core.remote.call("setFairyResList", new Responder(onGetFairyResAndList), tid);
                            };
                        };
                        showtext = Language.FAIRY_MANAGER_PANEL_U[93];
                        if (FAIRY_SKIN_NEED_ITEM[int(tid)])
                        {
                            showtext = Language.FAIRY_MANAGER_PANEL_U[108];
                        };
                        _alert = Alert.show(showtext, null, (Alert.YES | Alert.NO), null, func);
                    }
                    else
                    {
                        updateView();
                    };
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get fairySkillTitle():BasicTitleCanvas
        {
            return (this._647326148fairySkillTitle);
        }

        private function _FairySkinCanvas_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[89];
        }

        private function checkThisFairyDress(_arg_1:*):Boolean
        {
            var _local_2:*;
            for (_local_2 in _fairyResList)
            {
                if (Number(_fairyResList[_local_2]) == _arg_1)
                {
                    return (true);
                };
            };
            for (_local_2 in _core.player.fairyList)
            {
                if (((_core.player.fairyList[_local_2].tData) && (_core.player.fairyList[_local_2].tData.id == _arg_1)))
                {
                    return (true);
                };
            };
            return (false);
        }

        private function _FairySkinCanvas_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[89];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                fairySkillTitle.text = _arg_1;
            }, "fairySkillTitle.text");
            result[0] = binding;
            return (result);
        }

        private function onMove(_arg_1:Event):void
        {
            this.x = (_p.x + _p.width);
            this.y = _p.y;
        }

        override public function set visible(_arg_1:Boolean):void
        {
            if (_p)
            {
                super.visible = _arg_1;
                if (_arg_1)
                {
                    follow(_p);
                    if (_id != _core.cid)
                    {
                        isLoadCharactorFairyFlag = false;
                    };
                    if (!isLoadCharactorFairyFlag)
                    {
                        updateView();
                    }
                    else
                    {
                        initSkinPanelView();
                    };
                    if (this.parent)
                    {
                        this.parent.setChildIndex(this, (this.parent.numChildren - 1));
                    };
                }
                else
                {
                    _p.removeEventListener(DragableCanvas.EVENT_MOVE, onMove);
                };
            }
            else
            {
                super.visible = false;
            };
        }

        private function updateFairSkinView():void
        {
            var _local_2:Array;
            var _local_3:*;
            var _local_11:*;
            var _local_12:*;
            var _local_13:Image;
            var _local_14:Image;
            var _local_15:CharactorShowCanvas;
            var _local_16:String;
            var _local_17:Button;
            var _local_18:SimpleCanvas;
            var _local_1:Array = GameData.d[GamePredef.TBL_FAIRY_TEMPALTE];
            _local_2 = new Array();
            for (_local_3 in _local_1)
            {
                _local_2.push(_local_1[_local_3]);
            };
            for (_local_3 in _local_2)
            {
                if (_local_2[_local_3])
                {
                    _local_2[_local_3].isHad = 2;
                    for (_local_11 in _core.player.fairyList)
                    {
                        if (((_core.player.fairyList[_local_11].tData) && (_core.player.fairyList[_local_11].tData.id == _local_2[_local_3].id)))
                        {
                            _local_2[_local_3].isHad = 1;
                            break;
                        };
                    };
                };
            };
            if (_fairyResList)
            {
                for (_local_3 in _local_2)
                {
                    if (_local_2[_local_3])
                    {
                        for (_local_12 in _fairyResList)
                        {
                            if (_local_2[_local_3].id == Number(_fairyResList[_local_12]))
                            {
                                _local_2[_local_3].isHad = 1;
                                break;
                            };
                        };
                    };
                };
            };
            _local_2.sortOn(["isHad", "id"], Array.NUMERIC);
            var _local_4:Array = imageCanvas.getChildren();
            if (((_local_4) && (_local_4.length > 0)))
            {
                imageCanvas.removeAllChildren();
            };
            var _local_5:* = 147;
            var _local_6:int;
            var _local_7:int;
            var _local_8:Number = 0.3086;
            var _local_9:Number = 0.694;
            var _local_10:Number = 0.082;
            if (btnDict)
            {
                for (_local_3 in btnDict)
                {
                    delete btnDict[_local_3];
                };
            };
            for (_local_3 in _local_2)
            {
                if (_local_2[_local_3])
                {
                    _local_13 = new Image();
                    _local_13.source = FAIRY_BACKGROUND;
                    _local_14 = new Image();
                    _local_14.source = FAIRY_BINDED;
                    _local_15 = new CharactorShowCanvas();
                    _local_16 = ResManager.getResUrl(_local_2[_local_3].rc);
                    _local_15.url = _local_16;
                    _local_15.color = _local_2[_local_3].cc;
                    _local_17 = new Button();
                    _local_17.name = _local_2[_local_3].id;
                    _local_17.id = ("btn" + _local_2[_local_3].id);
                    btnDict[_local_17.id] = _local_17;
                    _local_17.addEventListener(MouseEvent.CLICK, clickBtn);
                    if (_fairyActive == _local_2[_local_3].id)
                    {
                        _local_17.label = Language.FAIRY_MANAGER_PANEL_U[90];
                    }
                    else
                    {
                        _local_17.label = Language.FAIRY_MANAGER_PANEL_U[91];
                    };
                    _local_17.styleName = "BtnStdRed";
                    _local_18 = new SimpleCanvas();
                    _local_18.verticalScrollPolicy = "off";
                    _local_18.id = ("scanvas" + _local_2[_local_3].id);
                    _local_18.addChild(_local_13);
                    _local_18.addChild(_local_15);
                    _local_18.addChild(_local_14);
                    _local_18.addChild(_local_17);
                    if (_local_5 == 5)
                    {
                        _local_5 = 147;
                    }
                    else
                    {
                        if (_local_5 == 147)
                        {
                            _local_5 = 5;
                        };
                    };
                    if (_local_7 == 0)
                    {
                        _local_6 = 6;
                    }
                    else
                    {
                        if ((_local_7 / 2))
                        {
                            _local_6 = int(((Math.floor((_local_7 / 2)) * 135) + 6));
                        };
                    };
                    _local_14.x = 5;
                    _local_14.y = 5;
                    _local_14.width = 29;
                    _local_14.height = 90;
                    _local_13.x = 5;
                    _local_13.y = 5;
                    _local_13.width = 128;
                    _local_13.height = 128;
                    _local_15.x = 95;
                    _local_15.y = 170;
                    _local_15.width = 10;
                    _local_15.height = 13;
                    _local_17.x = 90;
                    _local_17.y = 105;
                    _local_18.x = _local_5;
                    if (_local_6 == 6)
                    {
                        _local_18.y = 5;
                    }
                    else
                    {
                        _local_18.y = _local_6;
                    };
                    _local_18.height = 135;
                    _local_18.width = 135;
                    _local_18.styleName = "CanvasBorder";
                    imageCanvas.addChild(_local_18);
                    if (((_local_2[_local_3].isHad) && (_local_2[_local_3].isHad == 1)))
                    {
                        _local_13.filters = [];
                    }
                    else
                    {
                        _local_14.visible = false;
                        _local_17.label = Language.FAIRY_MANAGER_PANEL_U[92];
                    };
                    _local_7++;
                };
            };
            _fairyCount = _local_7;
        }

        public function set fairySkillTitle(_arg_1:BasicTitleCanvas):void
        {
            var _local_2:Object = this._647326148fairySkillTitle;
            if (_local_2 !== _arg_1)
            {
                this._647326148fairySkillTitle = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fairySkillTitle", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.comp

