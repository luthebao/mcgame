// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.ChangeColorPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BoxLabel;
    import com.qeedoo.ui.view.comp.BasicTxtButton;
    import mx.controls.HSlider;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import com.qeedoo.ui.view.comp.SimpleCanvas;
    import com.qeedoo.ui.view.comp.CharactorShowCanvas;
    import mx.controls.Button;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.List;
    import mx.core.UIComponentDescriptor;
    import mx.containers.HBox;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import flash.events.MouseEvent;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.ui.resource.ResManager;
    import mx.controls.Alert;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.view.ViewManager;
    import mx.events.CloseEvent;
    import com.qeedoo.game.config.ItemConfig;
    import mx.events.FlexEvent;
    import mx.binding.Binding;
    import com.qeedoo.game.object.Player;
    import com.qeedoo.game.object.Charactor;
    import flash.events.Event;
    import mx.core.ClassFactory;
    import mx.events.SliderEvent;
    import flash.utils.getDefinitionByName;
    import com.qeedoo.game.logic.PetLogic;
    import mx.events.ListEvent;
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

    public class ChangeColorPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private const CHANG_ITEM_COST:int = 3;
        private var _1980426224colorCode:Number;
        private var _991692313petNum:BoxLabel;
        private var _188974544levelLabel:BasicTxtButton;
        private var changeObj:Object;
        private var _1848420007colorCodeHSlider:HSlider;
        private var _1680475757changeColor:BasicGlowButton;
        private var _486099079targetChar:BasicGlowButton;
        private var isChangePet:Boolean;
        private var _1215755049nameLabel:BasicTxtButton;
        private var _1348199777cvsPet:SimpleCanvas;
        private var _350425604oldShowCVS:SimpleCanvas;
        public var isRebirthDress:String = "";
        private var _815590962targetPet:BasicGlowButton;
        private var petId:Number;
        private var _486576174targetShow:CharactorShowCanvas;
        private var _205980803btnLeft:Button;
        private var targetObj:Object;
        private var resCode:Number;
        private var _2096098592btnRight:Button;
        public var _ChangeColorPanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var petArr:Array;
        public var _ChangeColorPanel_BasicTxtButton2:BasicTxtButton;
        public var _ChangeColorPanel_BasicTxtButton4:BasicTxtButton;
        public var _ChangeColorPanel_BasicTxtButton5:BasicTxtButton;
        private var _579057063petDataList:List;
        private var _1379429948oldShow:CharactorShowCanvas;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":305,
                    "height":260,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_ChangeColorPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":HBox,
                        "stylesFactory":function ():void
                        {
                            this.horizontalGap = 0;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":30,
                                "y":40,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"targetChar",
                                    "events":{"click":"__targetChar_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":60,
                                            "styleName":"BtnStdRed",
                                            "selected":true
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"targetPet",
                                    "events":{"click":"__targetPet_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":60,
                                            "styleName":"BtnStdRed"
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":SimpleCanvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":15,
                                "y":60,
                                "width":275,
                                "height":185,
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":SimpleCanvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":5,
                                            "y":5,
                                            "width":130,
                                            "height":145,
                                            "styleName":"CanvasBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"nameLabel",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":8,
                                                        "y":8,
                                                        "width":65
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_ChangeColorPanel_BasicTxtButton2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":70,
                                                        "y":8,
                                                        "width":50
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"levelLabel",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":100,
                                                        "y":8,
                                                        "width":30
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":CharactorShowCanvas,
                                                "id":"targetShow",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":60,
                                                        "y":115,
                                                        "height":20,
                                                        "width":20
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Button,
                                                "id":"btnLeft",
                                                "events":{"click":"__btnLeft_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":21,
                                                        "y":115,
                                                        "width":20,
                                                        "height":20,
                                                        "styleName":"BtnLoginTurnLeft"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Button,
                                                "id":"btnRight",
                                                "events":{"click":"__btnRight_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":89,
                                                        "y":115,
                                                        "width":20,
                                                        "height":20,
                                                        "styleName":"BtnLoginTurnRight"
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":SimpleCanvas,
                                    "id":"cvsPet",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":140,
                                            "y":5,
                                            "width":130,
                                            "height":145,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "styleName":"CSSBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":List,
                                                            "id":"petDataList",
                                                            "events":{
                                                                "itemClick":"__petDataList_itemClick",
                                                                "mouseDown":"__petDataList_mouseDown"
                                                            },
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.backgroundAlpha = 0;
                                                                this.left = "5";
                                                                this.borderStyle = "none";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "horizontalScrollPolicy":"off",
                                                                    "y":5,
                                                                    "height":112,
                                                                    "width":116,
                                                                    "x":-6,
                                                                    "itemRenderer":_ChangeColorPanel_ClassFactory1_c()
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_ChangeColorPanel_BasicTxtButton4",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0,
                                                        "y":125,
                                                        "width":70,
                                                        "height":18
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BoxLabel,
                                                "id":"petNum",
                                                "stylesFactory":function ():void
                                                {
                                                    this.textAlign = "left";
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":70,
                                                        "y":125,
                                                        "width":55.4,
                                                        "height":18
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":SimpleCanvas,
                                    "id":"oldShowCVS",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":140,
                                            "y":5,
                                            "width":130,
                                            "height":145,
                                            "styleName":"CanvasBorder",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":BasicTxtButton,
                                                "id":"_ChangeColorPanel_BasicTxtButton5",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":40,
                                                        "y":10,
                                                        "width":50
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":CharactorShowCanvas,
                                                "id":"oldShow",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":60,
                                                        "y":115,
                                                        "height":20,
                                                        "width":20
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Button,
                                                "events":{"click":"___ChangeColorPanel_Button3_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":21,
                                                        "y":115,
                                                        "width":20,
                                                        "height":20,
                                                        "styleName":"BtnLoginTurnLeft"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Button,
                                                "events":{"click":"___ChangeColorPanel_Button4_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":89,
                                                        "y":115,
                                                        "width":20,
                                                        "height":20,
                                                        "styleName":"BtnLoginTurnRight"
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":HSlider,
                                    "id":"colorCodeHSlider",
                                    "events":{"change":"__colorCodeHSlider_change"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":0,
                                            "y":158,
                                            "width":170,
                                            "liveDragging":true,
                                            "minimum":-100,
                                            "maximum":150
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"changeColor",
                                    "events":{"click":"__changeColor_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":190,
                                            "y":154,
                                            "width":80,
                                            "styleName":"BtnNormalRed"
                                        });
                                    }
                                })]
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function ChangeColorPanel()
        {
            mx_internal::_document = this;
            this.width = 305;
            this.height = 260;
            this.styleName = "StandardContent";
            this.cacheAsBitmap = true;
            this.addEventListener("creationComplete", ___ChangeColorPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            ChangeColorPanel._watcherSetupUtil = _arg_1;
        }


        public function __changeColor_click(_arg_1:MouseEvent):void
        {
            subChange();
        }

        public function set btnLeft(_arg_1:Button):void
        {
            var _local_2:Object = this._205980803btnLeft;
            if (_local_2 !== _arg_1)
            {
                this._205980803btnLeft = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnLeft", _local_2, _arg_1));
            };
        }

        public function updateView():void
        {
            var _local_1:String = ResManager.getResUrl(resCode);
            if (targetShow.url != _local_1)
            {
                targetShow.url = _local_1;
            };
            targetShow.color = colorCode;
        }

        [Bindable(event="propertyChange")]
        public function get oldShowCVS():SimpleCanvas
        {
            return (this._350425604oldShowCVS);
        }

        private function init():void
        {
            showCharView();
        }

        private function rollShow(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                if (targetShow.url != null)
                {
                    targetShow.rollRight();
                };
                if (oldShowCVS.visible)
                {
                    oldShow.rollRight();
                };
            }
            else
            {
                if (targetShow.url != null)
                {
                    targetShow.rollLeft();
                };
                if (oldShowCVS.visible)
                {
                    oldShow.rollLeft();
                };
            };
        }

        public function set targetChar(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._486099079targetChar;
            if (_local_2 !== _arg_1)
            {
                this._486099079targetChar = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "targetChar", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get btnRight():Button
        {
            return (this._2096098592btnRight);
        }

        public function set changeColor(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1680475757changeColor;
            if (_local_2 !== _arg_1)
            {
                this._1680475757changeColor = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "changeColor", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get nameLabel():BasicTxtButton
        {
            return (this._1215755049nameLabel);
        }

        [Bindable(event="propertyChange")]
        public function get targetShow():CharactorShowCanvas
        {
            return (this._486576174targetShow);
        }

        private function subChange():void
        {
            var needItem:Number;
            changeObj = {
                "colorCode":colorCode,
                "isPet":isChangePet,
                "id":petId
            };
            var func:Function = function (_arg_1:CloseEvent):void
            {
                var _local_2:int;
                var _local_3:Object;
                var _local_4:String;
                var _local_5:String;
                var _local_6:String;
                if (_arg_1.detail == Alert.YES)
                {
                    if (isChangePet)
                    {
                        if ("1" != petDataList.selectedItem.petData.binded)
                        {
                            Alert.show(Language.CHANGECOLORPANEL_S[20], "", Alert.OK);
                            return;
                        };
                    };
                    _local_2 = _core.hasItemNum(GamePredef.TBL_ITEM_TEMPLATE, needItem);
                    if (_local_2 >= CHANG_ITEM_COST)
                    {
                        _core.remote.call("changeColor", null, changeObj);
                    }
                    else
                    {
                        _local_3 = _core.view.getUI(ViewManager.MAIN_CONSUMP);
                        _local_4 = Language.CHANGECOLORPANEL_S[19];
                        if (isChangePet)
                        {
                            _local_5 = Language.CHANGECOLORPANEL_S[6];
                            _local_6 = Language.CHANGECOLORPANEL_S[4];
                        }
                        else
                        {
                            _local_5 = Language.CHANGECOLORPANEL_S[5];
                            _local_6 = Language.CHANGECOLORPANEL_S[3];
                        };
                        _local_4 = _local_4.replace("{type}", _local_5).replace("{item}", _local_6).replace("{num}", Number((CHANG_ITEM_COST - _local_2)));
                        _local_3.msg = _local_4;
                        _local_3.x = 200;
                        _local_3.y = 380;
                        _local_3.itemData = {
                            "id":needItem,
                            "type":GamePredef.TBL_ITEM_TEMPLATE
                        };
                        _local_3.shopNum = 1;
                        _local_3.numAble = true;
                    };
                };
            };
            var str:String = Language.CHANGECOLORPANEL_S[2];
            needItem = ((isChangePet) ? ItemConfig.ITEM_CHANGE_PET_COLOR : ItemConfig.ITEM_CHANGE_CHAR_COLOR);
            if (isChangePet)
            {
                str = str.replace("{item}", Language.CHANGECOLORPANEL_S[4]).replace("{type}", Language.CHANGECOLORPANEL_S[6]);
            }
            else
            {
                str = str.replace("{item}", Language.CHANGECOLORPANEL_S[3]).replace("{type}", Language.CHANGECOLORPANEL_S[5]);
            };
            Alert.show(str, "", (Alert.YES | Alert.NO), null, func);
        }

        private function showCharView():void
        {
            targetChar.selected = true;
            targetPet.selected = false;
            cvsPet.visible = false;
            oldShowCVS.visible = true;
            isChangePet = false;
            targetObj = _core.player;
            resCode = getCharClassRes(_core.player, isRebirthDress);
            colorCode = _core.player.colorCode;
            nameLabel.text = targetObj.name;
            levelLabel.text = _core.player.level.toString();
            updateView();
            showOldChar();
        }

        private function petDataListClick():void
        {
            if (petArr.length == 0)
            {
                viewClear();
                return;
            };
            if (petDataList.selectedItem == null)
            {
                viewClear();
                return;
            };
            targetObj = petDataList.selectedItem.petData;
            resCode = targetObj.creatureData.resCode;
            petId = targetObj.id;
            nameLabel.text = targetObj.petName;
            levelLabel.text = petDataList.selectedItem.level;
            colorCode = ((targetObj.colorCode) ? targetObj.colorCode : targetObj.creatureData.colorCode);
            updateView();
        }

        public function ___ChangeColorPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        private function _ChangeColorPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHANGECOLORPANEL_S[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ChangeColorPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_ChangeColorPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHANGECOLORPANEL_S[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                targetChar.label = _arg_1;
            }, "targetChar.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHANGECOLORPANEL_S[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                targetPet.label = _arg_1;
            }, "targetPet.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHANGECOLORPANEL_S[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ChangeColorPanel_BasicTxtButton2.text = _arg_1;
            }, "_ChangeColorPanel_BasicTxtButton2.text");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.PETMANAGEPRANEL_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ChangeColorPanel_BasicTxtButton4.text = _arg_1;
            }, "_ChangeColorPanel_BasicTxtButton4.text");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHANGECOLORPANEL_S[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ChangeColorPanel_BasicTxtButton5.text = _arg_1;
            }, "_ChangeColorPanel_BasicTxtButton5.text");
            result[5] = binding;
            binding = new Binding(this, function ():Number
            {
                return (colorCode);
            }, function (_arg_1:Number):void
            {
                colorCodeHSlider.value = _arg_1;
            }, "colorCodeHSlider.value");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHARSELECTCANVAS_U[34];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                colorCodeHSlider.toolTip = _arg_1;
            }, "colorCodeHSlider.toolTip");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CHANGECOLORPANEL_S[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                changeColor.label = _arg_1;
            }, "changeColor.label");
            result[8] = binding;
            return (result);
        }

        public function refreshColor(_arg_1:Charactor):void
        {
            if ((_arg_1 is Player))
            {
                if (oldShow.url)
                {
                    oldShow.color = _arg_1.colorCode;
                };
            };
            if (_arg_1.resCode == getCharClassRes(_arg_1, isRebirthDress))
            {
                _arg_1.view.colorCode = _arg_1.colorCode;
            };
        }

        public function set cvsPet(_arg_1:SimpleCanvas):void
        {
            var _local_2:Object = this._1348199777cvsPet;
            if (_local_2 !== _arg_1)
            {
                this._1348199777cvsPet = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cvsPet", _local_2, _arg_1));
            };
        }

        public function set btnRight(_arg_1:Button):void
        {
            var _local_2:Object = this._2096098592btnRight;
            if (_local_2 !== _arg_1)
            {
                this._2096098592btnRight = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnRight", _local_2, _arg_1));
            };
        }

        public function set nameLabel(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._1215755049nameLabel;
            if (_local_2 !== _arg_1)
            {
                this._1215755049nameLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nameLabel", _local_2, _arg_1));
            };
        }

        public function set petDataList(_arg_1:List):void
        {
            var _local_2:Object = this._579057063petDataList;
            if (_local_2 !== _arg_1)
            {
                this._579057063petDataList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petDataList", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get colorCodeHSlider():HSlider
        {
            return (this._1848420007colorCodeHSlider);
        }

        public function set targetShow(_arg_1:CharactorShowCanvas):void
        {
            var _local_2:Object = this._486576174targetShow;
            if (_local_2 !== _arg_1)
            {
                this._486576174targetShow = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "targetShow", _local_2, _arg_1));
            };
        }

        private function changeTarget(_arg_1:int=0):void
        {
            switch (_arg_1)
            {
                case 0:
                    showCharView();
                    return;
                case 1:
                    showPetView();
                    return;
            };
        }

        private function showColor(_arg_1:Event):void
        {
            colorCode = _arg_1.currentTarget.value;
            targetShow.color = colorCode;
        }

        private function showOldChar():void
        {
            var _local_1:String = ResManager.getResUrl(resCode);
            oldShow.url = _local_1;
            oldShow.color = _core.player.colorCode;
        }

        public function __petDataList_mouseDown(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
        }

        private function _ChangeColorPanel_ClassFactory1_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = ChangeColorPanel_inlineComponent1;
            _local_1.properties = {"outerDocument":this};
            return (_local_1);
        }

        public function __colorCodeHSlider_change(_arg_1:SliderEvent):void
        {
            showColor(_arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get btnLeft():Button
        {
            return (this._205980803btnLeft);
        }

        [Bindable(event="propertyChange")]
        public function get targetChar():BasicGlowButton
        {
            return (this._486099079targetChar);
        }

        public function __btnRight_click(_arg_1:MouseEvent):void
        {
            rollShow(true);
        }

        public function set oldShow(_arg_1:CharactorShowCanvas):void
        {
            var _local_2:Object = this._1379429948oldShow;
            if (_local_2 !== _arg_1)
            {
                this._1379429948oldShow = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "oldShow", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get changeColor():BasicGlowButton
        {
            return (this._1680475757changeColor);
        }

        override public function initialize():void
        {
            var target:ChangeColorPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _ChangeColorPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_ChangeColorPanelWatcherSetupUtil");
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

        public function set targetPet(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._815590962targetPet;
            if (_local_2 !== _arg_1)
            {
                this._815590962targetPet = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "targetPet", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get cvsPet():SimpleCanvas
        {
            return (this._1348199777cvsPet);
        }

        public function set levelLabel(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._188974544levelLabel;
            if (_local_2 !== _arg_1)
            {
                this._188974544levelLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "levelLabel", _local_2, _arg_1));
            };
        }

        private function showPetView():void
        {
            var _local_2:Object;
            var _local_3:Class;
            targetChar.selected = false;
            targetPet.selected = true;
            cvsPet.visible = true;
            oldShowCVS.visible = false;
            isChangePet = true;
            petArr = new Array();
            var _local_1:int;
            for each (_local_2 in _core.player.petList)
            {
                if (((_local_2) && (_local_2.creatureData)))
                {
                    _local_1++;
                    if (_local_2.state != 1)
                    {
                        if (_local_2.state == 2)
                        {
                            _local_3 = ResManager.ICON_PET_FOLLOW;
                        }
                        else
                        {
                            _local_3 = ResManager.ICON_PET_STANDBY;
                        };
                        petArr.push({
                            "id":_local_2.id,
                            "text":_local_2.petName,
                            "level":PetLogic.expToLv(_local_2.exp),
                            "icon":_local_3,
                            "sort1":_local_2.tid,
                            "sort2":_local_2.growRate,
                            "color":GamePredef.CODE_ITEM_COLOR[_core.basic.colorByGrowRate(_local_2.growRate)],
                            "petData":_local_2
                        });
                    };
                };
            };
            petArr.sortOn(["sort1", "sort2"], [Array.NUMERIC, Array.NUMERIC]);
            if (_core.battlePet)
            {
                petArr.unshift({
                    "id":_core.battlePet.id,
                    "text":_core.battlePet.petName,
                    "level":PetLogic.expToLv(_core.battlePet.exp),
                    "icon":ResManager.ICON_PET_BATTLE,
                    "color":GamePredef.CODE_ITEM_COLOR[_core.basic.colorByGrowRate(_core.battlePet.growRate)],
                    "petData":_core.battlePet
                });
            };
            if (petArr.length > 0)
            {
                petDataList.dataProvider = petArr;
                petDataList.selectedIndex = 0;
                petDataListClick();
            };
            petNum.text = ((_local_1.toString() + "/") + _core.player.petMaxNum);
        }

        [Bindable(event="propertyChange")]
        public function get petDataList():List
        {
            return (this._579057063petDataList);
        }

        private function viewClear():void
        {
            targetShow.url = null;
            nameLabel.text = "";
            levelLabel.text = "";
        }

        public function __targetChar_click(_arg_1:MouseEvent):void
        {
            changeTarget(0);
        }

        public function set colorCodeHSlider(_arg_1:HSlider):void
        {
            var _local_2:Object = this._1848420007colorCodeHSlider;
            if (_local_2 !== _arg_1)
            {
                this._1848420007colorCodeHSlider = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "colorCodeHSlider", _local_2, _arg_1));
            };
        }

        public function ___ChangeColorPanel_Button3_click(_arg_1:MouseEvent):void
        {
            rollShow(false);
        }

        public function __petDataList_itemClick(_arg_1:ListEvent):void
        {
            petDataListClick();
        }

        [Bindable(event="propertyChange")]
        public function get oldShow():CharactorShowCanvas
        {
            return (this._1379429948oldShow);
        }

        private function _ChangeColorPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.CHANGECOLORPANEL_S[0];
            _local_1 = Language.CHANGECOLORPANEL_S[13];
            _local_1 = Language.CHANGECOLORPANEL_S[14];
            _local_1 = Language.CHANGECOLORPANEL_S[7];
            _local_1 = Language.PETMANAGEPRANEL_U[8];
            _local_1 = Language.CHANGECOLORPANEL_S[15];
            _local_1 = colorCode;
            _local_1 = Language.CHARSELECTCANVAS_U[34];
            _local_1 = Language.CHANGECOLORPANEL_S[16];
        }

        public function set petNum(_arg_1:BoxLabel):void
        {
            var _local_2:Object = this._991692313petNum;
            if (_local_2 !== _arg_1)
            {
                this._991692313petNum = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "petNum", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get levelLabel():BasicTxtButton
        {
            return (this._188974544levelLabel);
        }

        [Bindable(event="propertyChange")]
        public function get targetPet():BasicGlowButton
        {
            return (this._815590962targetPet);
        }

        private function set colorCode(_arg_1:Number):void
        {
            var _local_2:Object = this._1980426224colorCode;
            if (_local_2 !== _arg_1)
            {
                this._1980426224colorCode = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "colorCode", _local_2, _arg_1));
            };
        }

        override public function set visible(_arg_1:Boolean):void
        {
            super.visible = _arg_1;
            if (((initialized) && (_arg_1)))
            {
                showCharView();
            };
        }

        [Bindable(event="propertyChange")]
        public function get petNum():BoxLabel
        {
            return (this._991692313petNum);
        }

        [Bindable(event="propertyChange")]
        private function get colorCode():Number
        {
            return (this._1980426224colorCode);
        }

        public function __btnLeft_click(_arg_1:MouseEvent):void
        {
            rollShow(false);
        }

        private function getCharClassRes(_arg_1:Charactor, _arg_2:String):Number
        {
            var _local_3:Object = _core.data.getGameData(GamePredef.TBL_CLASS, _arg_1.classId);
            if (_local_3)
            {
                if (_arg_1.gender == 0)
                {
                    return (_local_3[("resCodeMale" + _arg_2)]);
                };
                return (_local_3[("resCodeFemale" + _arg_2)]);
            };
            return (_arg_1.resCode);
        }

        public function __targetPet_click(_arg_1:MouseEvent):void
        {
            changeTarget(1);
        }

        public function set oldShowCVS(_arg_1:SimpleCanvas):void
        {
            var _local_2:Object = this._350425604oldShowCVS;
            if (_local_2 !== _arg_1)
            {
                this._350425604oldShowCVS = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "oldShowCVS", _local_2, _arg_1));
            };
        }

        public function ___ChangeColorPanel_Button4_click(_arg_1:MouseEvent):void
        {
            rollShow(true);
        }


    }
}//package com.qeedoo.ui.view.compDragable

