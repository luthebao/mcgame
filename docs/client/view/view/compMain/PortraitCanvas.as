// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compMain.PortraitCanvas

package com.qeedoo.ui.view.compMain
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.game.vo.PersonInfoVO;
    import com.qeedoo.ui.view.comp.Property;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.controls.Image;
    import mx.controls.Button;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.ui.resource.ResManager;
    import flash.events.MouseEvent;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.ui.view.compDragable.CharactorPanel;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.config.Language;
    import flash.net.Responder;
    import com.adobe.crypto.MD5;
    import mx.controls.Alert;
    import mx.events.CloseEvent;
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

    public class PortraitCanvas extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var iconCode:String = "";
        private var _1184171033infoVO:PersonInfoVO;
        private var _104066928mpBar:Property;
        private var _109608054spBar:Property;
        public var _PortraitCanvas_RoundedLabel1:RoundedLabel;
        private var _116765vip:BasicGlowButton;
        private var _205996609btnLvUp:BasicGlowButton;
        private var _1959281015labelExp:RoundedLabel;
        private var _99449323hpBar:Property;
        private var _382789291selfHeadPMFlag:Image;
        private var _1191676748selfHead:Image;
        private var _99449908hpBtn:Button;
        public var _PortraitCanvas_Button3:Button;
        private var _1289197386expBar:Property;
        private var _104067513mpBtn:Button;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({"childDescriptors":[new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":192,
                                "height":57,
                                "styleName":"CanvasCharacterPortrait",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Property,
                                    "id":"hpBar",
                                    "events":{"click":"__hpBar_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":80,
                                            "y":20,
                                            "width":89,
                                            "height":9,
                                            "styleName":"ProgressHp"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Property,
                                    "id":"mpBar",
                                    "events":{"click":"__mpBar_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":80,
                                            "y":30,
                                            "width":89,
                                            "height":9,
                                            "styleName":"ProgressMp"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Property,
                                    "id":"spBar",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":80,
                                            "y":40,
                                            "width":105,
                                            "height":6,
                                            "styleName":"ProgressSp"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Property,
                                    "id":"expBar",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":80,
                                            "y":47,
                                            "width":105,
                                            "height":6,
                                            "styleName":"ProgressExp"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"hpBtn",
                                    "events":{"click":"__hpBtn_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.cornerRadius = 0;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":175,
                                            "y":19,
                                            "visible":true,
                                            "width":10,
                                            "height":9
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"mpBtn",
                                    "events":{"click":"__mpBtn_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.cornerRadius = 0;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":175,
                                            "y":29,
                                            "visible":true,
                                            "width":10,
                                            "height":9
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"selfHead",
                                    "events":{"click":"__selfHead_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "useHandCursor":true,
                                            "buttonMode":true,
                                            "width":49,
                                            "x":5,
                                            "height":47,
                                            "y":5
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"selfHeadPMFlag",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":27,
                                            "x":5,
                                            "height":24,
                                            "y":1,
                                            "visible":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"_PortraitCanvas_RoundedLabel1",
                                    "events":{"click":"___PortraitCanvas_RoundedLabel1_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.textAlign = "center";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":86,
                                            "x":84,
                                            "y":3
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"labelExp",
                                    "stylesFactory":function ():void
                                    {
                                        this.textAlign = "center";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":62,
                                            "y":1,
                                            "width":22,
                                            "text":"99"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"_PortraitCanvas_Button3",
                                    "events":{"click":"___PortraitCanvas_Button3_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.right = "4";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":3,
                                            "label":"",
                                            "styleName":"BtnUseItem"
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"btnLvUp",
                        "events":{"click":"__btnLvUp_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":198,
                                "y":0,
                                "styleName":"BtnLevelUp",
                                "width":46,
                                "height":22
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"vip",
                        "events":{"click":"__vip_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":198,
                                "y":30,
                                "styleName":"BtnLevelUp",
                                "width":46,
                                "height":22,
                                "visible":true
                            });
                        }
                    })]});
            }
        });
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function PortraitCanvas()
        {
            mx_internal::_document = this;
            this.horizontalScrollPolicy = "off";
            this.verticalScrollPolicy = "off";
            this.cacheAsBitmap = true;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            PortraitCanvas._watcherSetupUtil = _arg_1;
        }


        public function set btnLvUp(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._205996609btnLvUp;
            if (_local_2 !== _arg_1)
            {
                this._205996609btnLvUp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnLvUp", _local_2, _arg_1));
            };
        }

        public function updateCharHeadImg(_arg_1:Number):void
        {
            selfHead.source = ResManager.getIconUrl(_arg_1);
        }

        private function recoverFullHpMp():void
        {
            recoverFullHp(1, -1);
            recoverFullMp(1, -1);
        }

        public function set mpBtn(_arg_1:Button):void
        {
            var _local_2:Object = this._104067513mpBtn;
            if (_local_2 !== _arg_1)
            {
                this._104067513mpBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mpBtn", _local_2, _arg_1));
            };
        }

        public function __vip_click(_arg_1:MouseEvent):void
        {
            showPmPanel(infoVO);
        }

        private function changeLevelAddStyleName():*
        {
            var _local_1:* = _core.view.getUI(ViewManager.PANEL_CHARACTOR);
            (_local_1 as CharactorPanel).setLevelUPStyleName();
        }

        override public function initialize():void
        {
            var target:PortraitCanvas;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _PortraitCanvas_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compMain_PortraitCanvasWatcherSetupUtil");
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

        private function changeAddStyleName():*
        {
            var _local_1:* = _core.view.getUI(ViewManager.PANEL_CHARACTOR);
            (_local_1 as CharactorPanel).setAddStyleName();
        }

        public function disableUI():void
        {
            this.hpBtn.enabled = false;
            this.mpBtn.enabled = false;
            this.btnLvUp.enabled = false;
        }

        public function updateView(_arg_1:Object):void
        {
            update();
        }

        public function __mpBar_click(_arg_1:MouseEvent):void
        {
            recoverFullMp(1, -1);
        }

        public function recoverFullMp(_arg_1:*, _arg_2:*):void
        {
            var _local_6:*;
            var _local_7:*;
            var _local_3:Object = {
                "158":300,
                "125":600,
                "126":1000,
                "127":2000,
                "322":3000,
                "370":5000,
                "1974":7000
            };
            var _local_4:Array = [];
            var _local_5:int = (GamePredef.SLOT_SID_BAG[0] + 1);
            while (_local_5 <= GamePredef.SLOT_SID_BAG[7])
            {
                _local_6 = _core.data.getSlot({"sid":_local_5});
                if (((_local_6) && (_local_6.type == GamePredef.TBL_ITEM_INSTANCE)))
                {
                    _local_7 = _core.data.getData(GamePredef.TBL_ITEM_INSTANCE, _local_6.itemId);
                    if (_local_3[_local_7.tid])
                    {
                        _local_4.push({
                            "sid":_local_6.id,
                            "priority":(_local_3[_local_7.tid] - _local_7.binded)
                        });
                    };
                };
                _local_5++;
            };
            _local_4.sortOn("priority", Array.NUMERIC);
            _core.remote.call("fullMpRecoverByItem", null, _arg_1, _arg_2, _local_4);
        }

        public function setLevelUpBtn():void
        {
            var _local_2:String;
            var _local_3:Number;
            var _local_1:String = _core.player.expSkill.toString();
            if (_core.player.level >= GamePredef.MAX_LEVEL)
            {
                _local_2 = "-";
            }
            else
            {
                _local_3 = _core.basic.levelUpExp(_core.player.level);
                _local_2 = Math.round(_local_3).toString();
            };
            expBar.toolTip = Language.CHARACTORPANEL_S[34].toString().replace("{exp}", _local_1).replace("{next}", _local_2);
            btnLvUp.toolTip = Language.CHARACTORPANEL_S[34].toString().replace("{exp}", _local_1).replace("{next}", _local_2);
            if (((infoVO.currentExp >= infoVO.maxExp) && (_core.player.level < GamePredef.MAX_LEVEL)))
            {
                if (_core.player.level < 20)
                {
                    levelUp();
                }
                else
                {
                    if (((null == GamePredef.GLOBAL_SETTING["sjan"]) || (GamePredef.GLOBAL_SETTING["sjan"] == false)))
                    {
                        btnLvUp.visible = true;
                    }
                    else
                    {
                        btnLvUp.visible = false;
                    };
                };
            }
            else
            {
                btnLvUp.visible = false;
            };
        }

        [Bindable(event="propertyChange")]
        public function get labelExp():RoundedLabel
        {
            return (this._1959281015labelExp);
        }

        [Bindable(event="propertyChange")]
        public function get spBar():Property
        {
            return (this._109608054spBar);
        }

        public function ___PortraitCanvas_Button3_click(_arg_1:MouseEvent):void
        {
            mouseAction(_arg_1, GamePredef.ACTION_ITEM);
        }

        public function ___PortraitCanvas_RoundedLabel1_click(_arg_1:MouseEvent):void
        {
            recoverFullHpMp();
        }

        public function set selfHead(_arg_1:Image):void
        {
            var _local_2:Object = this._1191676748selfHead;
            if (_local_2 !== _arg_1)
            {
                this._1191676748selfHead = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "selfHead", _local_2, _arg_1));
            };
        }

        public function __mpBtn_click(_arg_1:MouseEvent):void
        {
            showBloodAdd(2);
        }

        private function _PortraitCanvas_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = ((("HP: " + hpBar.value) + "/") + hpBar.maximum);
            _local_1 = ((("MP: " + mpBar.value) + "/") + mpBar.maximum);
            _local_1 = ((("SP: " + spBar.value) + "/") + spBar.maximum);
            _local_1 = ((_core.bloodBag[1] > 0) ? ((_core.bloodBag[1] == _core.bagMax[1]) ? "BtnHp2" : "BtnHp1") : "BtnHp0");
            _local_1 = ((_core.bloodBag[2] > 0) ? ((_core.bloodBag[2] == _core.bagMax[2]) ? "BtnMp2" : "BtnMp1") : "BtnMp0");
            _local_1 = infoVO.resUrl;
            _local_1 = Language.PORTRAITCANVAS_S[4];
            _local_1 = infoVO.charName;
            _local_1 = infoVO.level;
            _local_1 = Language.PORTRAITCANVAS_S[5];
            _local_1 = Language.PORTRAITCANVAS_U[0];
            _local_1 = Language.PORTRAITCANVAS_U[3];
        }

        public function set spBar(_arg_1:Property):void
        {
            var _local_2:Object = this._109608054spBar;
            if (_local_2 !== _arg_1)
            {
                this._109608054spBar = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "spBar", _local_2, _arg_1));
            };
        }

        private function doLevelUp(_arg_1:String):void
        {
            var _local_2:Number = _core.player.expSkill;
            var _local_3:Number = _core.basic.levelUpExp(_core.player.level);
            if (_local_2 >= _local_3)
            {
                _core.remote.call("lvUp", new Responder(onLevelUp), _core.player.level, _arg_1);
            }
            else
            {
                btnLvUp.visible = false;
            };
        }

        public function __selfHead_click(_arg_1:MouseEvent):void
        {
            _core.view.changeVisible(ViewManager.PANEL_CHARACTOR);
            changeAddStyleName();
        }

        [Bindable(event="propertyChange")]
        public function get expBar():Property
        {
            return (this._1289197386expBar);
        }

        public function __btnLvUp_click(_arg_1:MouseEvent):void
        {
            levelUp();
            changeLevelAddStyleName();
        }

        public function updatePlayerPmFlag(_arg_1:Number):void
        {
            this.selfHeadPMFlag.visible = false;
            if (((_arg_1) && (Number(_arg_1) > 0)))
            {
                if (ResManager[("PM_ZUAN" + _arg_1)])
                {
                    this.selfHeadPMFlag.source = ResManager[("PM_ZUAN" + _arg_1)];
                    this.selfHeadPMFlag.visible = true;
                };
            }
            else
            {
                this.selfHeadPMFlag.visible = false;
            };
        }

        private function mouseAction(_arg_1:MouseEvent, _arg_2:int):void
        {
            if (((((_core.player) && (_core.player.mapData)) && (_core.player.mapData.templateId)) && (((int(_core.player.mapData.templateId) == 2007) || (int(_core.player.mapData.templateId) == 2008)) || (int(_core.player.mapData.templateId) == 2009))))
            {
                _core.sysMidMsg(Language.MAZE_INFO_PANEL_U[13]);
                return;
            };
            _core.view.getUI(ViewManager.PANEL_BAG).visible = true;
            _arg_1.stopImmediatePropagation();
            if (_arg_2 == GamePredef.ACTION_REPAIR_NOWEAR)
            {
                if (_arg_1.ctrlKey)
                {
                    _core.remote.repairAll(1);
                    return;
                };
            };
            if (_core.state == GamePredef.ST_BATTLE)
            {
                return;
            };
            _core.view.showMouse(ResManager.MOUSE_ACTION_IMG[_arg_2]);
            _core.view.mouseState = _arg_2;
            _core.view.mouseTargetType = GamePredef.MOUSE_TARGET_CHA;
        }

        private function levelUp():void
        {
            var _levelUp:Function;
            if (_core.player.level >= GamePredef.MAX_LEVEL)
            {
                btnLvUp.visible = false;
                return;
            };
            _levelUp = function (_arg_1:String):void
            {
                var _local_2:String;
                if (_arg_1)
                {
                    _local_2 = MD5.hash(_arg_1);
                    doLevelUp(_local_2);
                };
            };
            var func:Function = function (_arg_1:CloseEvent):void
            {
                if (Alert.YES == _arg_1.detail)
                {
                    if (_core.delPass)
                    {
                        doLevelUp(_core.delPass);
                    }
                    else
                    {
                        _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.PORTRAITCANVAS_U[0], _levelUp);
                    };
                };
            };
            if (_core.player.level >= 20)
            {
                Alert.show(Language.PORTRAITCANVAS_U[2], "", (Alert.YES | Alert.NO), this, func);
            }
            else
            {
                doLevelUp(null);
            };
        }

        [Bindable(event="propertyChange")]
        public function get btnLvUp():BasicGlowButton
        {
            return (this._205996609btnLvUp);
        }

        public function set selfHeadPMFlag(_arg_1:Image):void
        {
            var _local_2:Object = this._382789291selfHeadPMFlag;
            if (_local_2 !== _arg_1)
            {
                this._382789291selfHeadPMFlag = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "selfHeadPMFlag", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get hpBtn():Button
        {
            return (this._99449908hpBtn);
        }

        [Bindable(event="propertyChange")]
        public function get mpBtn():Button
        {
            return (this._104067513mpBtn);
        }

        public function update():void
        {
            if (_core.player)
            {
                gameObj = _core.player;
            };
        }

        public function set gameObj(_arg_1:Object):void
        {
            var _local_3:String;
            var _local_4:String;
            var _local_5:Number;
            if (infoVO == null)
            {
                infoVO = new PersonInfoVO();
            };
            var _local_2:int = _arg_1.level;
            if (_arg_1.isLeader)
            {
                infoVO.isLeader = true;
            }
            else
            {
                infoVO.isLeader = false;
            };
            infoVO.level = _local_2;
            infoVO.charName = _arg_1.name;
            infoVO.charClass = _core.getClassName(_arg_1.classId);
            infoVO.currentExp = _arg_1.expSkill;
            infoVO.currentHp = _arg_1.currentHp;
            infoVO.currentMp = _arg_1.currentMp;
            infoVO.currentSp = _arg_1.currentSp;
            infoVO.maxExp = _core.basic.levelUpExp(_local_2);
            if (_arg_1.property)
            {
                infoVO.maxHp = _arg_1.property.finalHp;
                infoVO.maxMp = _arg_1.property.finalMp;
                infoVO.maxSp = _arg_1.property.finalSp;
            }
            else
            {
                infoVO.maxHp = _arg_1.currentHp;
                infoVO.maxMp = _arg_1.currentMp;
                infoVO.maxSp = _arg_1.currentSp;
            };
            infoVO.resUrl = ResManager.getIconUrl(_arg_1.iconCode);
            iconCode = _arg_1.iconCode;
            hpBar.setProgress(infoVO.currentHp, infoVO.maxHp);
            mpBar.setProgress(infoVO.currentMp, infoVO.maxMp);
            spBar.setProgress(infoVO.currentSp, infoVO.maxSp);
            expBar.setProgress(((infoVO.currentExp > infoVO.maxExp) ? infoVO.maxExp : infoVO.currentExp), infoVO.maxExp);
            this.selfHeadPMFlag.visible = false;
            if ((((_core.player) && (_core.player.pmLevel)) && (Number(_core.player.pmLevel) > 0)))
            {
                if (ResManager[("PM_ZUAN" + _core.player.pmLevel)])
                {
                    this.selfHeadPMFlag.source = ResManager[("PM_ZUAN" + _core.player.pmLevel)];
                    this.selfHeadPMFlag.visible = true;
                };
            };
            _local_3 = _core.player.expSkill.toString();
            if (_core.player.level >= GamePredef.MAX_LEVEL)
            {
                _local_4 = "-";
            }
            else
            {
                _local_5 = _core.basic.levelUpExp(_core.player.level);
                _local_4 = Math.round(_local_5).toString();
            };
            expBar.toolTip = Language.CHARACTORPANEL_S[34].toString().replace("{exp}", _local_3).replace("{next}", _local_4);
            btnLvUp.toolTip = Language.CHARACTORPANEL_S[34].toString().replace("{exp}", _local_3).replace("{next}", _local_4);
            if (((infoVO.currentExp >= infoVO.maxExp) && (_core.player.level < GamePredef.MAX_LEVEL)))
            {
                if (_core.player.level < 20)
                {
                    levelUp();
                }
                else
                {
                    if (((null == GamePredef.GLOBAL_SETTING["sjan"]) || (GamePredef.GLOBAL_SETTING["sjan"] == false)))
                    {
                        btnLvUp.visible = true;
                    }
                    else
                    {
                        btnLvUp.visible = false;
                    };
                };
            }
            else
            {
                btnLvUp.visible = false;
            };
        }

        public function set labelExp(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1959281015labelExp;
            if (_local_2 !== _arg_1)
            {
                this._1959281015labelExp = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "labelExp", _local_2, _arg_1));
            };
        }

        public function setHpMp():void
        {
            if (((!(_core.bloodBag[1])) || (_core.bloodBag[1] <= 0)))
            {
                hpBtn.toolTip = Language.PORTRAITCANVAS_S[0];
                hpBtn.styleName = "BtnHp0";
            }
            else
            {
                hpBtn.toolTip = ((Language.PORTRAITCANVAS_S[1] + _core.bloodBag[1]) + "/10000000");
                if (_core.bloodBag[1] == _core.bagMax[1])
                {
                    hpBtn.styleName = "BtnHp2";
                }
                else
                {
                    hpBtn.styleName = "BtnHp1";
                };
            };
            if (((!(_core.bloodBag[2])) || (_core.bloodBag[2] <= 0)))
            {
                mpBtn.toolTip = Language.PORTRAITCANVAS_S[2];
                mpBtn.styleName = "BtnMp0";
            }
            else
            {
                mpBtn.toolTip = ((Language.PORTRAITCANVAS_S[3] + _core.bloodBag[2]) + "/10000000");
                if (_core.bloodBag[2] == _core.bagMax[2])
                {
                    mpBtn.styleName = "BtnMp2";
                }
                else
                {
                    mpBtn.styleName = "BtnMp1";
                };
            };
        }

        private function set infoVO(_arg_1:PersonInfoVO):void
        {
            var _local_2:Object = this._1184171033infoVO;
            if (_local_2 !== _arg_1)
            {
                this._1184171033infoVO = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "infoVO", _local_2, _arg_1));
            };
        }

        private function _PortraitCanvas_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = ((("HP: " + hpBar.value) + "/") + hpBar.maximum);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                hpBar.toolTip = _arg_1;
            }, "hpBar.toolTip");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = ((("MP: " + mpBar.value) + "/") + mpBar.maximum);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                mpBar.toolTip = _arg_1;
            }, "mpBar.toolTip");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = ((("SP: " + spBar.value) + "/") + spBar.maximum);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                spBar.toolTip = _arg_1;
            }, "spBar.toolTip");
            result[2] = binding;
            binding = new Binding(this, function ():Object
            {
                return ((_core.bloodBag[1] > 0) ? ((_core.bloodBag[1] == _core.bagMax[1]) ? "BtnHp2" : "BtnHp1") : "BtnHp0");
            }, function (_arg_1:Object):void
            {
                hpBtn.styleName = _arg_1;
            }, "hpBtn.styleName");
            result[3] = binding;
            binding = new Binding(this, function ():Object
            {
                return ((_core.bloodBag[2] > 0) ? ((_core.bloodBag[2] == _core.bagMax[2]) ? "BtnMp2" : "BtnMp1") : "BtnMp0");
            }, function (_arg_1:Object):void
            {
                mpBtn.styleName = _arg_1;
            }, "mpBtn.styleName");
            result[4] = binding;
            binding = new Binding(this, function ():Object
            {
                return (infoVO.resUrl);
            }, function (_arg_1:Object):void
            {
                selfHead.source = _arg_1;
            }, "selfHead.source");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PORTRAITCANVAS_S[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                selfHead.toolTip = _arg_1;
            }, "selfHead.toolTip");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = infoVO.charName;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PortraitCanvas_RoundedLabel1.text = _arg_1;
            }, "_PortraitCanvas_RoundedLabel1.text");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = infoVO.level;
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                labelExp.htmlText = _arg_1;
            }, "labelExp.htmlText");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PORTRAITCANVAS_S[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _PortraitCanvas_Button3.toolTip = _arg_1;
            }, "_PortraitCanvas_Button3.toolTip");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PORTRAITCANVAS_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnLvUp.label = _arg_1;
            }, "btnLvUp.label");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PORTRAITCANVAS_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                vip.label = _arg_1;
            }, "vip.label");
            result[11] = binding;
            return (result);
        }

        public function set vip(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._116765vip;
            if (_local_2 !== _arg_1)
            {
                this._116765vip = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vip", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get selfHead():Image
        {
            return (this._1191676748selfHead);
        }

        public function set hpBar(_arg_1:Property):void
        {
            var _local_2:Object = this._99449323hpBar;
            if (_local_2 !== _arg_1)
            {
                this._99449323hpBar = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hpBar", _local_2, _arg_1));
            };
        }

        public function enableUI():void
        {
            this.hpBtn.enabled = true;
            this.mpBtn.enabled = true;
            this.btnLvUp.enabled = true;
        }

        public function showPmPanel(_arg_1:Object):void
        {
            var _local_2:Object = _core.view.getUI(ViewManager.PANEL_PM);
            if (_local_2)
            {
                _local_2.initPanelData(_arg_1);
            };
        }

        public function __hpBar_click(_arg_1:MouseEvent):void
        {
            recoverFullHp(1, -1);
        }

        public function initView():void
        {
            update();
        }

        public function __hpBtn_click(_arg_1:MouseEvent):void
        {
            showBloodAdd(1);
        }

        private function onLevelUp(_arg_1:Boolean):void
        {
            if (((_arg_1) && (_core.player.level > 20)))
            {
                _core.view.show(ViewManager.PANEL_CHARACTOR);
            };
            if (_core.view.getUI(ViewManager.PANEL_ACTIVE).visible)
            {
                _core.view.getUI(ViewManager.PANEL_ACTIVE).visible = false;
                _core.view.getUI(ViewManager.PANEL_ACTIVE).visible = true;
            };
            if (_core.view.getUI(ViewManager.PANEL_SKILLMANAGER).visible)
            {
                _core.view.getUI(ViewManager.PANEL_SKILLMANAGER).update();
            };
        }

        [Bindable(event="propertyChange")]
        public function get vip():BasicGlowButton
        {
            return (this._116765vip);
        }

        private function showBloodAdd(_arg_1:int):void
        {
            _core.view.getUI(ViewManager.PANEL_BLOODADD).showPanel(_arg_1);
        }

        public function set mpBar(_arg_1:Property):void
        {
            var _local_2:Object = this._104066928mpBar;
            if (_local_2 !== _arg_1)
            {
                this._104066928mpBar = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mpBar", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get hpBar():Property
        {
            return (this._99449323hpBar);
        }

        [Bindable(event="propertyChange")]
        private function get infoVO():PersonInfoVO
        {
            return (this._1184171033infoVO);
        }

        public function set hpBtn(_arg_1:Button):void
        {
            var _local_2:Object = this._99449908hpBtn;
            if (_local_2 !== _arg_1)
            {
                this._99449908hpBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hpBtn", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get mpBar():Property
        {
            return (this._104066928mpBar);
        }

        public function set expBar(_arg_1:Property):void
        {
            var _local_2:Object = this._1289197386expBar;
            if (_local_2 !== _arg_1)
            {
                this._1289197386expBar = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "expBar", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get selfHeadPMFlag():Image
        {
            return (this._382789291selfHeadPMFlag);
        }

        public function recoverFullHp(_arg_1:*, _arg_2:*):void
        {
            var _local_6:*;
            var _local_7:*;
            if (((((_core.player) && (_core.player.mapData)) && (_core.player.mapData.templateId)) && (((int(_core.player.mapData.templateId) == 2007) || (int(_core.player.mapData.templateId) == 2008)) || (int(_core.player.mapData.templateId) == 2009))))
            {
                _core.sysMidMsg(Language.MAZE_INFO_PANEL_U[13]);
                return;
            };
            var _local_3:Object = {
                "1":300,
                "4":600,
                "2":600,
                "110":1000,
                "113":2000,
                "321":3000,
                "371":6000,
                "1975":9000
            };
            var _local_4:Array = [];
            var _local_5:int = (GamePredef.SLOT_SID_BAG[0] + 1);
            while (_local_5 <= GamePredef.SLOT_SID_BAG[7])
            {
                _local_6 = _core.data.getSlot({"sid":_local_5});
                if (((_local_6) && (_local_6.type == GamePredef.TBL_ITEM_INSTANCE)))
                {
                    _local_7 = _core.data.getData(GamePredef.TBL_ITEM_INSTANCE, _local_6.itemId);
                    if (_local_3[_local_7.tid])
                    {
                        _local_4.push({
                            "sid":_local_6.id,
                            "priority":(_local_3[_local_7.tid] - _local_7.binded)
                        });
                    };
                };
                _local_5++;
            };
            _local_4.sortOn("priority", Array.NUMERIC);
            _core.remote.call("fullHpRecoverByItem", null, _arg_1, _arg_2, _local_4);
        }


    }
}//package com.qeedoo.ui.view.compMain

