// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.FairySkillCanvas

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.containers.VBox;
    import mx.controls.Label;
    import mx.containers.Canvas;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.events.Event;
    import mx.events.FlexEvent;
    import flash.events.MouseEvent;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.logic.FairyLogic;
    import com.qeedoo.ui.utils.ToolKit;
    import flash.net.Responder;
    import com.qeedoo.game.config.ItemConfig;
    import mx.controls.Alert;
    import mx.events.CloseEvent;
    import com.qeedoo.game.utils.TextUtil;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.ui.event.GameEvent;
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

    public class FairySkillCanvas extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1574166904learnBtn:DelayButton;
        private var _112005436vbox1:VBox;
        private var _102449glv:Label;
        private var _647326148fairySkillTitle:BasicTitleCanvas;
        private var _1554141555tabBtn4:BasicMultiLineButton;
        private var _2142164612fairySkill:ItemSlot;
        private var _900562943skill2:SkillUseSlot;
        public var _FairySkillCanvas_Label1:Label;
        private var _839841136upBtn1:BasicGlowButton;
        private var _550778330canvas2:Canvas;
        private var _3466lv:Label;
        private var _112005438vbox3:VBox;
        private var _1554141559tabBtn0:BasicMultiLineButton;
        private var _3519nm:Label;
        private var _839841133upBtn4:BasicGlowButton;
        private var _900562944skill1:SkillUseSlot;
        private var _1554141558tabBtn1:BasicMultiLineButton;
        private var _1554141557tabBtn2:BasicMultiLineButton;
        private var _900562941skill4:SkillUseSlot;
        private var _112005437vbox2:VBox;
        private var _839841134upBtn3:BasicGlowButton;
        private var _first:Boolean = true;
        private var _804478022configBtn:DelayButton;
        private var _1554141556tabBtn3:BasicMultiLineButton;
        private var _fairy:Object;
        private var _900562942skill3:SkillUseSlot;
        private var _btnEnabled:Boolean = true;
        private var _112005439vbox4:VBox;
        private var _839841135upBtn2:BasicGlowButton;
        private var _p:DragableCanvas;
        private var _1002706921simplecanvas3:SimpleCanvas;
        private var selectedTabIndex:int = 0;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":300,
                    "height":400,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"fairySkillTitle"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"canvas2",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":17,
                                "y":220,
                                "width":290,
                                "height":213,
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":BasicMultiLineButton,
                                    "id":"tabBtn0",
                                    "events":{"click":"__tabBtn0_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":6,
                                            "y":3,
                                            "styleName":"VerticalTab",
                                            "selected":true,
                                            "height":22
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicMultiLineButton,
                                    "id":"tabBtn1",
                                    "events":{"click":"__tabBtn1_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":6,
                                            "y":25,
                                            "styleName":"VerticalTab",
                                            "height":22
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicMultiLineButton,
                                    "id":"tabBtn2",
                                    "events":{"click":"__tabBtn2_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":6,
                                            "y":47,
                                            "styleName":"VerticalTab",
                                            "height":22
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicMultiLineButton,
                                    "id":"tabBtn3",
                                    "events":{"click":"__tabBtn3_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":6,
                                            "y":69,
                                            "styleName":"VerticalTab",
                                            "height":22
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicMultiLineButton,
                                    "id":"tabBtn4",
                                    "events":{"click":"__tabBtn4_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":6,
                                            "y":91,
                                            "styleName":"VerticalTab",
                                            "height":22
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":SimpleCanvas,
                                    "id":"simplecanvas3",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":25,
                                            "y":0,
                                            "width":265,
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":SkillUseSlot,
                                                "id":"skill1",
                                                "events":{
                                                    "click":"__skill1_click",
                                                    "creationComplete":"__skill1_creationComplete"
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":4.5,
                                                        "y":2,
                                                        "height":41,
                                                        "currentState":"pet",
                                                        "skillType":"pet",
                                                        "width":150
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":SkillUseSlot,
                                                "id":"skill2",
                                                "events":{
                                                    "click":"__skill2_click",
                                                    "creationComplete":"__skill2_creationComplete"
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":4.5,
                                                        "y":44,
                                                        "height":41,
                                                        "currentState":"pet",
                                                        "skillType":"pet",
                                                        "width":150
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":SkillUseSlot,
                                                "id":"skill3",
                                                "events":{
                                                    "click":"__skill3_click",
                                                    "creationComplete":"__skill3_creationComplete"
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":4.5,
                                                        "y":86,
                                                        "height":41,
                                                        "currentState":"pet",
                                                        "skillType":"pet",
                                                        "width":150
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":SkillUseSlot,
                                                "id":"skill4",
                                                "events":{
                                                    "click":"__skill4_click",
                                                    "creationComplete":"__skill4_creationComplete"
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":4.5,
                                                        "y":128,
                                                        "height":41,
                                                        "currentState":"pet",
                                                        "skillType":"pet",
                                                        "width":150
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":VBox,
                                                "id":"vbox1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalAlign = "center";
                                                    this.verticalGap = 1;
                                                    this.verticalAlign = "middle";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":142,
                                                        "y":3,
                                                        "percentWidth":100,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"upBtn1",
                                                            "events":{"click":"__upBtn1_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnNormalBlue",
                                                                    "height":19
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":VBox,
                                                "id":"vbox2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalAlign = "center";
                                                    this.verticalGap = 1;
                                                    this.verticalAlign = "middle";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":142,
                                                        "y":45,
                                                        "percentWidth":100,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"upBtn2",
                                                            "events":{"click":"__upBtn2_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnNormalBlue",
                                                                    "height":19
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":VBox,
                                                "id":"vbox3",
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalAlign = "center";
                                                    this.verticalGap = 1;
                                                    this.verticalAlign = "middle";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":142,
                                                        "y":87,
                                                        "percentWidth":100,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"upBtn3",
                                                            "events":{"click":"__upBtn3_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnNormalBlue",
                                                                    "height":19
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":VBox,
                                                "id":"vbox4",
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalAlign = "center";
                                                    this.verticalGap = 1;
                                                    this.verticalAlign = "middle";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":142,
                                                        "y":129,
                                                        "percentWidth":100,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":BasicGlowButton,
                                                            "id":"upBtn4",
                                                            "events":{"click":"__upBtn4_click"},
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "styleName":"BtnNormalBlue",
                                                                    "height":19
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"_FairySkillCanvas_Label1",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":130,
                                "y":153,
                                "width":94,
                                "height":23
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"nm",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":26,
                                "y":149,
                                "width":89
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"lv",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":26,
                                "y":171,
                                "width":80
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"glv",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":26,
                                "y":199,
                                "width":80
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ItemSlot,
                        "id":"fairySkill",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":178,
                                "x":139
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":DelayButton,
                        "id":"configBtn",
                        "events":{"click":"__configBtn_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":61,
                                "height":20,
                                "x":204,
                                "y":150,
                                "styleName":"BtnStdRed"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":DelayButton,
                        "id":"learnBtn",
                        "events":{"click":"__learnBtn_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":51,
                                "height":23,
                                "x":214,
                                "y":180,
                                "styleName":"BtnStdRed"
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        public var introText:IntroText = new IntroText();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function FairySkillCanvas()
        {
            mx_internal::_document = this;
            this.width = 300;
            this.height = 400;
            this.styleName = "StandardContent";
            this.cacheAsBitmap = true;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            FairySkillCanvas._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get skill1():SkillUseSlot
        {
            return (this._900562944skill1);
        }

        [Bindable(event="propertyChange")]
        public function get simplecanvas3():SimpleCanvas
        {
            return (this._1002706921simplecanvas3);
        }

        public function set skill2(_arg_1:SkillUseSlot):void
        {
            var _local_2:Object = this._900562943skill2;
            if (_local_2 !== _arg_1)
            {
                this._900562943skill2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skill2", _local_2, _arg_1));
            };
        }

        private function delSkill(_arg_1:int):void
        {
        }

        [Bindable(event="propertyChange")]
        public function get skill3():SkillUseSlot
        {
            return (this._900562942skill3);
        }

        private function useSkill(_arg_1:Event):void
        {
        }

        public function set skill3(_arg_1:SkillUseSlot):void
        {
            var _local_2:Object = this._900562942skill3;
            if (_local_2 !== _arg_1)
            {
                this._900562942skill3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skill3", _local_2, _arg_1));
            };
        }

        public function __skill3_creationComplete(_arg_1:FlexEvent):void
        {
            addEL(_arg_1);
        }

        public function addEL(_arg_1:Event):void
        {
        }

        [Bindable(event="propertyChange")]
        public function get skill2():SkillUseSlot
        {
            return (this._900562943skill2);
        }

        [Bindable(event="propertyChange")]
        public function get skill4():SkillUseSlot
        {
            return (this._900562941skill4);
        }

        [Bindable(event="propertyChange")]
        public function get canvas2():Canvas
        {
            return (this._550778330canvas2);
        }

        public function __skill4_creationComplete(_arg_1:FlexEvent):void
        {
            addEL(_arg_1);
        }

        public function set skill4(_arg_1:SkillUseSlot):void
        {
            var _local_2:Object = this._900562941skill4;
            if (_local_2 !== _arg_1)
            {
                this._900562941skill4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skill4", _local_2, _arg_1));
            };
        }

        public function set tabBtn2(_arg_1:BasicMultiLineButton):void
        {
            var _local_2:Object = this._1554141557tabBtn2;
            if (_local_2 !== _arg_1)
            {
                this._1554141557tabBtn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn2", _local_2, _arg_1));
            };
        }

        public function set tabBtn0(_arg_1:BasicMultiLineButton):void
        {
            var _local_2:Object = this._1554141559tabBtn0;
            if (_local_2 !== _arg_1)
            {
                this._1554141559tabBtn0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn0", _local_2, _arg_1));
            };
        }

        public function set tabBtn4(_arg_1:BasicMultiLineButton):void
        {
            var _local_2:Object = this._1554141555tabBtn4;
            if (_local_2 !== _arg_1)
            {
                this._1554141555tabBtn4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn4", _local_2, _arg_1));
            };
        }

        public function set lv(_arg_1:Label):void
        {
            var _local_2:Object = this._3466lv;
            if (_local_2 !== _arg_1)
            {
                this._3466lv = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lv", _local_2, _arg_1));
            };
        }

        public function set tabBtn3(_arg_1:BasicMultiLineButton):void
        {
            var _local_2:Object = this._1554141556tabBtn3;
            if (_local_2 !== _arg_1)
            {
                this._1554141556tabBtn3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn3", _local_2, _arg_1));
            };
        }

        public function set tabBtn1(_arg_1:BasicMultiLineButton):void
        {
            var _local_2:Object = this._1554141558tabBtn1;
            if (_local_2 !== _arg_1)
            {
                this._1554141558tabBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn1", _local_2, _arg_1));
            };
        }

        public function set upBtn3(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._839841134upBtn3;
            if (_local_2 !== _arg_1)
            {
                this._839841134upBtn3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "upBtn3", _local_2, _arg_1));
            };
        }

        public function set upBtn4(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._839841133upBtn4;
            if (_local_2 !== _arg_1)
            {
                this._839841133upBtn4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "upBtn4", _local_2, _arg_1));
            };
        }

        private function openSkill(_arg_1:int):void
        {
        }

        public function __skill4_click(_arg_1:MouseEvent):void
        {
            useSkill(_arg_1);
        }

        public function set skill1(_arg_1:SkillUseSlot):void
        {
            var _local_2:Object = this._900562944skill1;
            if (_local_2 !== _arg_1)
            {
                this._900562944skill1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skill1", _local_2, _arg_1));
            };
        }

        private function configSkill():void
        {
            var _local_1:Object = _core.view.getUI(ViewManager.PANEL_FAIRY_SKILL_CONFIG);
            if (_local_1)
            {
                _local_1.open(_fairy);
            };
        }

        private function skillTabBtnClick(_arg_1:int):void
        {
            drawSkillSlots(_arg_1);
            selectedTabIndex = _arg_1;
            var _local_2:int;
            while (_local_2 <= 4)
            {
                if (_local_2 == _arg_1)
                {
                    this[("tabBtn" + _local_2)].selected = true;
                }
                else
                {
                    this[("tabBtn" + _local_2)].selected = false;
                };
                _local_2++;
            };
        }

        public function __tabBtn3_click(_arg_1:MouseEvent):void
        {
            skillTabBtnClick(3);
        }

        [Bindable(event="propertyChange")]
        public function get glv():Label
        {
            return (this._102449glv);
        }

        public function __upBtn2_click(_arg_1:MouseEvent):void
        {
            upSkill(2);
        }

        [Bindable(event="propertyChange")]
        public function get fairySkillTitle():BasicTitleCanvas
        {
            return (this._647326148fairySkillTitle);
        }

        [Bindable(event="propertyChange")]
        public function get vbox2():VBox
        {
            return (this._112005437vbox2);
        }

        [Bindable(event="propertyChange")]
        public function get vbox3():VBox
        {
            return (this._112005438vbox3);
        }

        public function fairySkillItemChange(_arg_1:Event):void
        {
            var _local_2:Boolean;
            var _local_3:Object;
            if (fairySkill.slotData)
            {
                _local_2 = false;
                if (fairySkill.slotData.type == GamePredef.TBL_ITEM_INSTANCE)
                {
                    if (fairySkill.slotData.tid)
                    {
                        _local_3 = _core.data.getGameData(GamePredef.TBL_ITEM_TEMPLATE, fairySkill.slotData.tid);
                        if (((_local_3) && (_local_3.type == GamePredef.ITEM_TYPE_FAIRY_SKILL_ITEM)))
                        {
                            _local_2 = true;
                        };
                    };
                };
                if (!_local_2)
                {
                    fairySkill.clean();
                    _core.sysMidNote(Language.FAIRY_MANAGER_PANEL_U[83]);
                };
            };
        }

        public function set upBtn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._839841136upBtn1;
            if (_local_2 !== _arg_1)
            {
                this._839841136upBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "upBtn1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get vbox1():VBox
        {
            return (this._112005436vbox1);
        }

        [Bindable(event="propertyChange")]
        public function get vbox4():VBox
        {
            return (this._112005439vbox4);
        }

        public function set upBtn2(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._839841135upBtn2;
            if (_local_2 !== _arg_1)
            {
                this._839841135upBtn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "upBtn2", _local_2, _arg_1));
            };
        }

        private function onMove(_arg_1:Event):void
        {
            this.x = (_p.x + _p.width);
            this.y = _p.y;
        }

        public function enableUI():void
        {
            this._btnEnabled = true;
        }

        public function __skill1_click(_arg_1:MouseEvent):void
        {
            useSkill(_arg_1);
        }

        private function learnSkill():void
        {
            var _local_1:Object;
            var _local_2:Object;
            var _local_3:int;
            var _local_4:*;
            if (((fairySkill.slotData) && (_fairy)))
            {
                _local_1 = _core.data.getGameData(fairySkill.slotData.type, fairySkill.slotData.itemId);
                if (((!(_local_1)) || (!(_local_1.tid))))
                {
                    return;
                };
                _local_2 = _core.data.getGameData(GamePredef.TBL_ITEM_TEMPLATE, _local_1.tid);
                if ((((_local_2) && (_local_2.reqLevel)) && (Number(FairyLogic.gexpToLv(_fairy.gexp)) < Number(_local_2.reqLevel))))
                {
                    _core.sysMidNote(Language.FAIRY_MANAGER_PANEL_U[82]);
                    return;
                };
                _local_3 = 0;
                if (_fairy["skillFlag"])
                {
                    for (_local_4 in _fairy["skillFlag"])
                    {
                        if (((_fairy["skillFlag"][_local_4]) && (ToolKit.isBigThan(_fairy["skillFlag"][_local_4], 0))))
                        {
                            _local_3++;
                        };
                    };
                };
                if (_local_3 >= 20)
                {
                    _core.sysMidNote(Language.FAIRY_MANAGER_PANEL_U[84]);
                    return;
                };
                _core.remote.call("onSkill", new Responder(onSkill), _fairy.id, fairySkill.slotData.id);
                return;
            };
        }

        public function set configBtn(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._804478022configBtn;
            if (_local_2 !== _arg_1)
            {
                this._804478022configBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "configBtn", _local_2, _arg_1));
            };
        }

        private function upSkill(index:int):void
        {
            var skillIndex:* = undefined;
            var skillData:Object;
            var func:Function;
            var func2:Function;
            skillIndex = ((selectedTabIndex * 4) + index);
            var str:String = "";
            if ((((_fairy) && (_fairy["skillFlag"])) && (ToolKit.isBigThan(_fairy["skillFlag"][("s" + skillIndex)], 0))))
            {
                skillData = _core.data.getGameData(GamePredef.TBL_SKILL, _fairy["skillFlag"][("s" + skillIndex)]);
                if (skillData)
                {
                    if (ToolKit.isBigOrEqual(skillData.level, 3))
                    {
                        _core.sysMsg(Language.PETPANEL_S[3]);
                    }
                    else
                    {
                        if (ToolKit.isEqual(skillData.level, 1))
                        {
                            if (_core.haveItem(GamePredef.TBL_ITEM_TEMPLATE, ItemConfig.ITEM_FAIRY_SKILL_UP_ITEM, 1))
                            {
                                func = function (_arg_1:CloseEvent):void
                                {
                                    if (_arg_1.detail == Alert.YES)
                                    {
                                        _core.remote.call("upFairySkill", new Responder(onUpFairySkill), _fairy.id, skillIndex);
                                    };
                                };
                                str = Language.PETPANEL_S[4];
                                str = str.replace("{skillData.name}", skillData.name);
                                Alert.show(str, "", 3, this, func);
                            }
                            else
                            {
                                str = Language.PETPANEL_S[5];
                                str = str.replace("{petSkillUpItem}", TextUtil.getCodeByTypeId(GamePredef.TBL_ITEM_TEMPLATE, ItemConfig.ITEM_FAIRY_SKILL_UP_ITEM));
                                _core.sysMsg(str);
                            };
                        }
                        else
                        {
                            if (ToolKit.isEqual(skillData.level, 2))
                            {
                                if (_core.haveItem(GamePredef.TBL_ITEM_TEMPLATE, ItemConfig.ITEM_FAIRY_SKILL_UP_ITEM, 3))
                                {
                                    func2 = function (_arg_1:CloseEvent):void
                                    {
                                        if (_arg_1.detail == Alert.YES)
                                        {
                                            _core.remote.call("upFairySkill", new Responder(onUpFairySkill), _fairy.id, skillIndex);
                                        };
                                    };
                                    str = Language.PETPANEL_S[6];
                                    str = str.replace("{skillData.name}", skillData.name);
                                    Alert.show(str, "", 3, this, func2);
                                }
                                else
                                {
                                    str = Language.PETPANEL_S[7];
                                    str = str.replace("{petSkillUpItem}", TextUtil.getCodeByTypeId(GamePredef.TBL_ITEM_TEMPLATE, ItemConfig.ITEM_FAIRY_SKILL_UP_ITEM));
                                    _core.sysMsg(str);
                                };
                            };
                        };
                    };
                };
            };
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

        public function __tabBtn0_click(_arg_1:MouseEvent):void
        {
            skillTabBtnClick(0);
        }

        public function __upBtn3_click(_arg_1:MouseEvent):void
        {
            upSkill(3);
        }

        public function disableUI():void
        {
            this._btnEnabled = false;
        }

        public function __tabBtn4_click(_arg_1:MouseEvent):void
        {
            skillTabBtnClick(4);
        }

        [Bindable(event="propertyChange")]
        public function get learnBtn():DelayButton
        {
            return (this._1574166904learnBtn);
        }

        public function set vbox2(_arg_1:VBox):void
        {
            var _local_2:Object = this._112005437vbox2;
            if (_local_2 !== _arg_1)
            {
                this._112005437vbox2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vbox2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get fairySkill():ItemSlot
        {
            return (this._2142164612fairySkill);
        }

        public function set vbox1(_arg_1:VBox):void
        {
            var _local_2:Object = this._112005436vbox1;
            if (_local_2 !== _arg_1)
            {
                this._112005436vbox1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vbox1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn0():BasicMultiLineButton
        {
            return (this._1554141559tabBtn0);
        }

        [Bindable(event="propertyChange")]
        public function get lv():Label
        {
            return (this._3466lv);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn3():BasicMultiLineButton
        {
            return (this._1554141556tabBtn3);
        }

        public function set nm(_arg_1:Label):void
        {
            var _local_2:Object = this._3519nm;
            if (_local_2 !== _arg_1)
            {
                this._3519nm = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nm", _local_2, _arg_1));
            };
        }

        public function set glv(_arg_1:Label):void
        {
            var _local_2:Object = this._102449glv;
            if (_local_2 !== _arg_1)
            {
                this._102449glv = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "glv", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:FairySkillCanvas;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _FairySkillCanvas_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_FairySkillCanvasWatcherSetupUtil");
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

        [Bindable(event="propertyChange")]
        public function get tabBtn1():BasicMultiLineButton
        {
            return (this._1554141558tabBtn1);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn2():BasicMultiLineButton
        {
            return (this._1554141557tabBtn2);
        }

        [Bindable(event="propertyChange")]
        public function get upBtn4():BasicGlowButton
        {
            return (this._839841133upBtn4);
        }

        [Bindable(event="propertyChange")]
        public function get upBtn3():BasicGlowButton
        {
            return (this._839841134upBtn3);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn4():BasicMultiLineButton
        {
            return (this._1554141555tabBtn4);
        }

        public function set vbox3(_arg_1:VBox):void
        {
            var _local_2:Object = this._112005438vbox3;
            if (_local_2 !== _arg_1)
            {
                this._112005438vbox3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vbox3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get upBtn1():BasicGlowButton
        {
            return (this._839841136upBtn1);
        }

        public function initSkillPanelView():void
        {
            fairySkill.addEventListener(GameEvent.SLOT_GIID_CHANGE, fairySkillItemChange);
        }

        [Bindable(event="propertyChange")]
        public function get upBtn2():BasicGlowButton
        {
            return (this._839841135upBtn2);
        }

        public function set fairy(_arg_1:Object):void
        {
            if (!(((((_fairy) && (_fairy.id)) && (_arg_1)) && (_arg_1.id)) && (_arg_1.id == _fairy.id)))
            {
                if (this.fairySkill)
                {
                    fairySkill.clean();
                };
            };
            _fairy = _arg_1;
            nm.text = _fairy.name;
            lv.text = ((Language.FAIRY_MANAGER_PANEL_U[30] + ":") + FairyLogic.expToLv(_fairy.exp).toString());
            glv.text = ((Language.FAIRY_MANAGER_PANEL_U[40] + ":") + FairyLogic.gexpToLv(_fairy.gexp).toString());
            skillTabBtnClick(selectedTabIndex);
        }

        public function set vbox4(_arg_1:VBox):void
        {
            var _local_2:Object = this._112005439vbox4;
            if (_local_2 !== _arg_1)
            {
                this._112005439vbox4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vbox4", _local_2, _arg_1));
            };
        }

        public function __skill2_click(_arg_1:MouseEvent):void
        {
            useSkill(_arg_1);
        }

        public function onSkill(_arg_1:Object):void
        {
            var _local_2:String;
            var _local_3:String;
            var _local_4:Number;
            var _local_5:Object;
            if (((_arg_1) && (_arg_1.flag)))
            {
                if (!_core.player.fairyList[_arg_1.id]["skillFlag"])
                {
                    _core.player.fairyList[_arg_1.id]["skillFlag"] = {};
                };
                if (!_arg_1["upSkill"])
                {
                    fairySkill.stackNum--;
                    if (fairySkill.stackNum <= 0)
                    {
                        fairySkill.clean();
                    };
                };
                _core.player.fairyList[_arg_1.id]["skillFlag"][_arg_1.sindex] = _arg_1.skill;
                _local_2 = _arg_1.sindex;
                _local_3 = _local_2.replace("s", "");
                _local_4 = Math.floor(((Number(_local_3) - 1) / 4));
                skillTabBtnClick(_local_4);
                _local_5 = _core.view.getUI(ViewManager.PANEL_FAIRY_SKILL_CONFIG);
                if (_local_5)
                {
                    _local_5.learnSkill(_arg_1.id);
                };
            }
            else
            {
                if ((((_arg_1) && (!(_arg_1.flag))) && (_arg_1.sindex == 1)))
                {
                    _core.sysMidNote(Language.FAIRY_MANAGER_PANEL_U[85]);
                }
                else
                {
                    if ((((_arg_1) && (!(_arg_1.flag))) && (_arg_1.sindex == 2)))
                    {
                        _core.sysMidNote(Language.FAIRY_MANAGER_PANEL_U[86]);
                    };
                };
            };
        }

        public function __tabBtn1_click(_arg_1:MouseEvent):void
        {
            skillTabBtnClick(1);
        }

        public function set canvas2(_arg_1:Canvas):void
        {
            var _local_2:Object = this._550778330canvas2;
            if (_local_2 !== _arg_1)
            {
                this._550778330canvas2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canvas2", _local_2, _arg_1));
            };
        }

        public function __skill1_creationComplete(_arg_1:FlexEvent):void
        {
            addEL(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get configBtn():DelayButton
        {
            return (this._804478022configBtn);
        }

        public function __upBtn4_click(_arg_1:MouseEvent):void
        {
            upSkill(4);
        }

        [Bindable(event="propertyChange")]
        public function get nm():Label
        {
            return (this._3519nm);
        }

        private function _FairySkillCanvas_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[79];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                fairySkillTitle.text = _arg_1;
            }, "fairySkillTitle.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETPANEL_U[26];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn0.label = _arg_1;
            }, "tabBtn0.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETPANEL_U[27];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn1.label = _arg_1;
            }, "tabBtn1.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETPANEL_U[28];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn2.label = _arg_1;
            }, "tabBtn2.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETPANEL_U[29];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn3.label = _arg_1;
            }, "tabBtn3.label");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETPANEL_U[30];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn4.label = _arg_1;
            }, "tabBtn4.label");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETPANEL_U[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                simplecanvas3.label = _arg_1;
            }, "simplecanvas3.label");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETPANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                upBtn1.label = _arg_1;
            }, "upBtn1.label");
            result[7] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (this._btnEnabled);
            }, function (_arg_1:Boolean):void
            {
                upBtn1.enabled = _arg_1;
            }, "upBtn1.enabled");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETPANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                upBtn2.label = _arg_1;
            }, "upBtn2.label");
            result[9] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (this._btnEnabled);
            }, function (_arg_1:Boolean):void
            {
                upBtn2.enabled = _arg_1;
            }, "upBtn2.enabled");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETPANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                upBtn3.label = _arg_1;
            }, "upBtn3.label");
            result[11] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (this._btnEnabled);
            }, function (_arg_1:Boolean):void
            {
                upBtn3.enabled = _arg_1;
            }, "upBtn3.enabled");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETPANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                upBtn4.label = _arg_1;
            }, "upBtn4.label");
            result[13] = binding;
            binding = new Binding(this, function ():Boolean
            {
                return (this._btnEnabled);
            }, function (_arg_1:Boolean):void
            {
                upBtn4.enabled = _arg_1;
            }, "upBtn4.enabled");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GAMEPREDEF_S[522];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FairySkillCanvas_Label1.text = _arg_1;
            }, "_FairySkillCanvas_Label1.text");
            result[15] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _FairySkillCanvas_Label1.filters = _arg_1;
            }, "_FairySkillCanvas_Label1.filters");
            result[16] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                nm.filters = _arg_1;
            }, "nm.filters");
            result[17] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                lv.filters = _arg_1;
            }, "lv.filters");
            result[18] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                glv.filters = _arg_1;
            }, "glv.filters");
            result[19] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_EQUFUNC_ITEM);
            }, function (_arg_1:int):void
            {
                fairySkill.slotType = _arg_1;
            }, "fairySkill.slotType");
            result[20] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[95];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                configBtn.label = _arg_1;
            }, "configBtn.label");
            result[21] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FAIRY_MANAGER_PANEL_U[80];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                learnBtn.label = _arg_1;
            }, "learnBtn.label");
            result[22] = binding;
            return (result);
        }

        public function set simplecanvas3(_arg_1:SimpleCanvas):void
        {
            var _local_2:Object = this._1002706921simplecanvas3;
            if (_local_2 !== _arg_1)
            {
                this._1002706921simplecanvas3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "simplecanvas3", _local_2, _arg_1));
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

        public function __skill2_creationComplete(_arg_1:FlexEvent):void
        {
            addEL(_arg_1);
        }

        private function drawSkillSlots(_arg_1:int):*
        {
            var _local_3:*;
            var _local_4:Object;
            var _local_2:int = 1;
            while (_local_2 <= 4)
            {
                this[("skill" + _local_2)].clean();
                _local_3 = ((_arg_1 * 4) + _local_2);
                if ((((_fairy) && (_fairy["skillFlag"])) && (ToolKit.isBigThan(_fairy["skillFlag"][("s" + _local_3)], 0))))
                {
                    _local_4 = _core.data.getGameData(GamePredef.TBL_SKILL, _fairy["skillFlag"][("s" + _local_3)]);
                    this[("skill" + _local_2)].giid = _fairy["skillFlag"][("s" + _local_3)];
                    this[("upBtn" + _local_2)].visible = true;
                    if (ToolKit.isBigOrEqual(_local_4.level, 3))
                    {
                        this[("upBtn" + _local_2)].enabled = false;
                    }
                    else
                    {
                        this[("upBtn" + _local_2)].enabled = true;
                    };
                    this[("upBtn" + _local_2)].includeInLayout = true;
                }
                else
                {
                    this[("skill" + _local_2)].enabled = true;
                    this[("upBtn" + _local_2)].visible = false;
                };
                _local_2++;
            };
        }

        public function __learnBtn_click(_arg_1:MouseEvent):void
        {
            learnSkill();
        }

        private function _FairySkillCanvas_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[79];
            _local_1 = Language.PETPANEL_U[26];
            _local_1 = Language.PETPANEL_U[27];
            _local_1 = Language.PETPANEL_U[28];
            _local_1 = Language.PETPANEL_U[29];
            _local_1 = Language.PETPANEL_U[30];
            _local_1 = Language.PETPANEL_U[19];
            _local_1 = Language.PETPANEL_U[5];
            _local_1 = this._btnEnabled;
            _local_1 = Language.PETPANEL_U[5];
            _local_1 = this._btnEnabled;
            _local_1 = Language.PETPANEL_U[5];
            _local_1 = this._btnEnabled;
            _local_1 = Language.PETPANEL_U[5];
            _local_1 = this._btnEnabled;
            _local_1 = Language.GAMEPREDEF_S[522];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Slot.SLOT_EQUFUNC_ITEM;
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[95];
            _local_1 = Language.FAIRY_MANAGER_PANEL_U[80];
        }

        public function __configBtn_click(_arg_1:MouseEvent):void
        {
            configSkill();
        }

        override public function set visible(_arg_1:Boolean):void
        {
            if (_p)
            {
                super.visible = _arg_1;
                if (_arg_1)
                {
                    follow(_p);
                    initSkillPanelView();
                    if (_first)
                    {
                        skillTabBtnClick(0);
                        _first = false;
                    };
                    if (this.parent)
                    {
                        this.parent.setChildIndex(this, (this.parent.numChildren - 1));
                    };
                    if (((this) && ((!(introText.parent)) || (!(introText.parent == this)))))
                    {
                        this.addChild(introText);
                        introText.width = 260;
                        introText.height = 110;
                        introText.x = 20;
                        introText.y = 33;
                        introText.htmlText = Language.FAIRY_MANAGER_PANEL_U[88];
                        introText.visible = true;
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

        public function __skill3_click(_arg_1:MouseEvent):void
        {
            useSkill(_arg_1);
        }

        public function onUpFairySkill(_arg_1:Object):void
        {
            if (_arg_1)
            {
                _arg_1["upSkill"] = true;
            };
            onSkill(_arg_1);
        }

        public function set learnBtn(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._1574166904learnBtn;
            if (_local_2 !== _arg_1)
            {
                this._1574166904learnBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "learnBtn", _local_2, _arg_1));
            };
        }

        public function __upBtn1_click(_arg_1:MouseEvent):void
        {
            upSkill(1);
        }

        public function __tabBtn2_click(_arg_1:MouseEvent):void
        {
            skillTabBtnClick(2);
        }

        public function set fairySkill(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2142164612fairySkill;
            if (_local_2 !== _arg_1)
            {
                this._2142164612fairySkill = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fairySkill", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.comp

