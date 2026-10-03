// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.AchievementDetail

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Button;
    import mx.controls.Label;
    import mx.states.RemoveChild;
    import mx.containers.Tile;
    import mx.controls.Image;
    import mx.states.SetStyle;
    import mx.states.SetProperty;
    import mx.containers.VBox;
    import mx.controls.Text;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.binding.BindingManager;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.predef.GamePredef;
    import mx.states.State;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.resource.ResManager;
    import mx.binding.Binding;
    import flash.display.DisplayObject;
    import mx.styles.IStyleClient;
    import flash.utils.getDefinitionByName;
    import com.qeedoo.game.data.GameData;
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

    public class AchievementDetail extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1621978433awardBtn:Button;
        private var _1930973972txtfield6:Label;
        private var _269348908txtfield13:Label;
        public var _AchievementDetail_RemoveChild1:RemoveChild;
        public var _AchievementDetail_RemoveChild2:RemoveChild;
        public var _AchievementDetail_RemoveChild3:RemoveChild;
        public var _AchievementDetail_RemoveChild4:RemoveChild;
        public var _AchievementDetail_RemoveChild5:RemoveChild;
        public var _AchievementDetail_RemoveChild6:RemoveChild;
        private var _1930973969txtfield9:Label;
        private var _1930973973txtfield5:Label;
        private var _2070982337enumList:Tile;
        public var aid:int = 0;
        private var _1330657564txtAchieveAward:BasicTxtButton;
        private var _1930973974txtfield4:Label;
        private var _269348907txtfield12:Label;
        private var _1844592686txtAchieveTime:BasicTxtButton;
        private var _859630293imageAch:Image;
        private var _1930973975txtfield3:Label;
        private var _1930973976txtfield2:Label;
        public var _AchievementDetail_SetStyle1:SetStyle;
        private var _269348906txtfield11:Label;
        public var _AchievementDetail_SetProperty1:SetProperty;
        public var _AchievementDetail_SetProperty2:SetProperty;
        public var _AchievementDetail_SetProperty3:SetProperty;
        public var _AchievementDetail_SetProperty4:SetProperty;
        public var _AchievementDetail_SetProperty5:SetProperty;
        private var _1930973977txtfield1:Label;
        private var _2143056348txtareaAchieveTitle:BasicTxtButton;
        private var _717359211progressList:VBox;
        private var _2009274043txtareaAchieveDesc:Text;
        public var _MAX_ENUM_NUM:int = 15;
        private var _1930973978txtfield0:Label;
        private var _269348905txtfield10:Label;
        private var _1822959109txtareaAchieveDetail:Text;
        private var _269348909txtfield14:Label;
        public var _finished:int = 0;
        private var _1930973970txtfield8:Label;
        private var _1930973971txtfield7:Label;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":345,
                    "height":54,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"txtareaAchieveTitle",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 14;
                            this.color = 0xFFFF00;
                            this.textAlign = "left";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":6,
                                "y":3,
                                "width":209,
                                "height":20
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Text,
                        "id":"txtareaAchieveDesc",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFF00;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":6,
                                "y":23,
                                "width":293,
                                "height":26,
                                "selectable":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"txtAchieveTime",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFF00;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":215,
                                "y":4,
                                "width":83
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"imageAch",
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "144";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":5,
                                "width":42,
                                "height":42
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicTxtButton,
                        "id":"txtAchieveAward",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "center";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "label":"10",
                                "x":307,
                                "y":13,
                                "width":20
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Text,
                        "id":"txtareaAchieveDetail",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFF;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "selectable":false,
                                "x":6,
                                "y":52,
                                "width":331,
                                "height":30,
                                "visible":false,
                                "includeInLayout":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Tile,
                        "id":"enumList",
                        "stylesFactory":function ():void
                        {
                            this.horizontalGap = 2;
                            this.verticalGap = 2;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "verticalScrollPolicy":"off",
                                "x":5,
                                "y":81,
                                "width":332,
                                "height":40,
                                "direction":"horizontal",
                                "visible":false,
                                "includeInLayout":false,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"txtfield0",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"visible":false});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"txtfield1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"visible":false});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"txtfield2",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"visible":false});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"txtfield3",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"visible":false});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"txtfield4",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"visible":false});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"txtfield5",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"visible":false});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"txtfield6",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"visible":false});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"txtfield7",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"visible":false});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"txtfield8",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"visible":false});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"txtfield9",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"visible":false});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"txtfield10",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"visible":false});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"txtfield11",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"visible":false});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"txtfield12",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"visible":false});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"txtfield13",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"visible":false});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"txtfield14",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"visible":false});
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":VBox,
                        "id":"progressList",
                        "stylesFactory":function ():void
                        {
                            this.verticalGap = 2;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":18,
                                "y":54,
                                "width":300,
                                "visible":false,
                                "includeInLayout":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"awardBtn",
                        "events":{"click":"__awardBtn_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnStdRed",
                                "x":220,
                                "y":22,
                                "visible":false,
                                "toolTip":""
                            });
                        }
                    })]
                });
            }
        });
        public var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function AchievementDetail()
        {
            mx_internal::_document = this;
            this.width = 345;
            this.height = 54;
            this.styleName = "CanvasAchDetail";
            this.states = [_AchievementDetail_State1_c(), _AchievementDetail_State2_c()];
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            AchievementDetail._watcherSetupUtil = _arg_1;
        }


        private function _AchievementDetail_SetProperty3_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _AchievementDetail_SetProperty3 = _local_1;
            _local_1.name = "width";
            _local_1.value = 70;
            BindingManager.executeBindings(this, "_AchievementDetail_SetProperty3", _AchievementDetail_SetProperty3);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get txtareaAchieveDetail():Text
        {
            return (this._1822959109txtareaAchieveDetail);
        }

        private function _AchievementDetail_RemoveChild6_i():RemoveChild
        {
            var _local_1:RemoveChild = new RemoveChild();
            _AchievementDetail_RemoveChild6 = _local_1;
            BindingManager.executeBindings(this, "_AchievementDetail_RemoveChild6", _AchievementDetail_RemoveChild6);
            return (_local_1);
        }

        public function set txtareaAchieveDetail(_arg_1:Text):void
        {
            var _local_2:Object = this._1822959109txtareaAchieveDetail;
            if (_local_2 !== _arg_1)
            {
                this._1822959109txtareaAchieveDetail = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtareaAchieveDetail", _local_2, _arg_1));
            };
        }

        private function _AchievementDetail_RemoveChild2_i():RemoveChild
        {
            var _local_1:RemoveChild = new RemoveChild();
            _AchievementDetail_RemoveChild2 = _local_1;
            BindingManager.executeBindings(this, "_AchievementDetail_RemoveChild2", _AchievementDetail_RemoveChild2);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get txtAchieveAward():BasicTxtButton
        {
            return (this._1330657564txtAchieveAward);
        }

        [Bindable(event="propertyChange")]
        public function get txtfield10():Label
        {
            return (this._269348905txtfield10);
        }

        [Bindable(event="propertyChange")]
        public function get txtfield11():Label
        {
            return (this._269348906txtfield11);
        }

        [Bindable(event="propertyChange")]
        public function get imageAch():Image
        {
            return (this._859630293imageAch);
        }

        [Bindable(event="propertyChange")]
        public function get txtfield14():Label
        {
            return (this._269348909txtfield14);
        }

        private function hideDetail():void
        {
            enumList.visible = false;
            enumList.includeInLayout = false;
            progressList.visible = false;
            progressList.includeInLayout = false;
            progressList.removeAllChildren();
            height = 54;
        }

        [Bindable(event="propertyChange")]
        public function get txtAchieveTime():BasicTxtButton
        {
            return (this._1844592686txtAchieveTime);
        }

        [Bindable(event="propertyChange")]
        public function get enumList():Tile
        {
            return (this._2070982337enumList);
        }

        public function set txtAchieveAward(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._1330657564txtAchieveAward;
            if (_local_2 !== _arg_1)
            {
                this._1330657564txtAchieveAward = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtAchieveAward", _local_2, _arg_1));
            };
        }

        private function _AchievementDetail_RemoveChild5_i():RemoveChild
        {
            var _local_1:RemoveChild = new RemoveChild();
            _AchievementDetail_RemoveChild5 = _local_1;
            BindingManager.executeBindings(this, "_AchievementDetail_RemoveChild5", _AchievementDetail_RemoveChild5);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get txtfield12():Label
        {
            return (this._269348907txtfield12);
        }

        public function set selected(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                filters = [GamePredef.FILTER_ACHIEVE_SELECTED];
                if (_finished)
                {
                    txtareaAchieveDetail.setStyle("color", 0xFFFF00);
                }
                else
                {
                    txtareaAchieveDetail.setStyle("color", 0xC8C8C8);
                };
            }
            else
            {
                filters = [];
                hideDetail();
                txtareaAchieveDetail.visible = false;
                txtareaAchieveDetail.includeInLayout = false;
            };
        }

        private function _AchievementDetail_RemoveChild1_i():RemoveChild
        {
            var _local_1:RemoveChild = new RemoveChild();
            _AchievementDetail_RemoveChild1 = _local_1;
            BindingManager.executeBindings(this, "_AchievementDetail_RemoveChild1", _AchievementDetail_RemoveChild1);
            return (_local_1);
        }

        private function _AchievementDetail_State2_c():State
        {
            var _local_1:State = new State();
            _local_1.name = "simple";
            _local_1.overrides = [_AchievementDetail_RemoveChild1_i(), _AchievementDetail_RemoveChild2_i(), _AchievementDetail_RemoveChild3_i(), _AchievementDetail_RemoveChild4_i(), _AchievementDetail_RemoveChild5_i(), _AchievementDetail_RemoveChild6_i(), _AchievementDetail_SetProperty1_i(), _AchievementDetail_SetProperty2_i(), _AchievementDetail_SetProperty3_i(), _AchievementDetail_SetProperty4_i(), _AchievementDetail_SetProperty5_i(), _AchievementDetail_SetStyle1_i(), _AchievementDetail_SetProperty6_c()];
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get txtareaAchieveDesc():Text
        {
            return (this._2009274043txtareaAchieveDesc);
        }

        private function _AchievementDetail_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = enumList;
            _local_1 = progressList;
            _local_1 = txtareaAchieveDesc;
            _local_1 = txtareaAchieveDetail;
            _local_1 = imageAch;
            _local_1 = txtAchieveAward;
            _local_1 = txtAchieveTime;
            _local_1 = txtAchieveTime;
            _local_1 = txtAchieveTime;
            _local_1 = txtareaAchieveTitle;
            _local_1 = txtareaAchieveTitle;
            _local_1 = txtareaAchieveTitle;
            _local_1 = Language.ACHIEVEMENTPANEL_U[0];
            _local_1 = Language.ACHIEVEMENTPANEL_U[0];
            _local_1 = ((_finished) ? ResManager.ICON_ACHIEVEMENT : ResManager.ICON_ACHIEVEMENT_DISABLED);
            _local_1 = Language.ACHIEVEMENTPANEL_U[0];
            _local_1 = Language.MEDAL_P[31];
        }

        public function set txtfield13(_arg_1:Label):void
        {
            var _local_2:Object = this._269348908txtfield13;
            if (_local_2 !== _arg_1)
            {
                this._269348908txtfield13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtfield13", _local_2, _arg_1));
            };
        }

        private function _AchievementDetail_SetProperty6_c():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _local_1.name = "width";
            _local_1.value = 78;
            return (_local_1);
        }

        private function _AchievementDetail_SetProperty2_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _AchievementDetail_SetProperty2 = _local_1;
            _local_1.name = "y";
            _local_1.value = 20;
            BindingManager.executeBindings(this, "_AchievementDetail_SetProperty2", _AchievementDetail_SetProperty2);
            return (_local_1);
        }

        public function set txtAchieveTime(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._1844592686txtAchieveTime;
            if (_local_2 !== _arg_1)
            {
                this._1844592686txtAchieveTime = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtAchieveTime", _local_2, _arg_1));
            };
        }

        public function set imageAch(_arg_1:Image):void
        {
            var _local_2:Object = this._859630293imageAch;
            if (_local_2 !== _arg_1)
            {
                this._859630293imageAch = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imageAch", _local_2, _arg_1));
            };
        }

        public function set txtareaAchieveTitle(_arg_1:BasicTxtButton):void
        {
            var _local_2:Object = this._2143056348txtareaAchieveTitle;
            if (_local_2 !== _arg_1)
            {
                this._2143056348txtareaAchieveTitle = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtareaAchieveTitle", _local_2, _arg_1));
            };
        }

        public function set txtfield12(_arg_1:Label):void
        {
            var _local_2:Object = this._269348907txtfield12;
            if (_local_2 !== _arg_1)
            {
                this._269348907txtfield12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtfield12", _local_2, _arg_1));
            };
        }

        public function set txtfield14(_arg_1:Label):void
        {
            var _local_2:Object = this._269348909txtfield14;
            if (_local_2 !== _arg_1)
            {
                this._269348909txtfield14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtfield14", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get txtareaAchieveTitle():BasicTxtButton
        {
            return (this._2143056348txtareaAchieveTitle);
        }

        [Bindable(event="propertyChange")]
        public function get progressList():VBox
        {
            return (this._717359211progressList);
        }

        public function set txtfield11(_arg_1:Label):void
        {
            var _local_2:Object = this._269348906txtfield11;
            if (_local_2 !== _arg_1)
            {
                this._269348906txtfield11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtfield11", _local_2, _arg_1));
            };
        }

        private function _AchievementDetail_SetStyle1_i():SetStyle
        {
            var _local_1:SetStyle = new SetStyle();
            _AchievementDetail_SetStyle1 = _local_1;
            _local_1.name = "fontSize";
            _local_1.value = 12;
            BindingManager.executeBindings(this, "_AchievementDetail_SetStyle1", _AchievementDetail_SetStyle1);
            return (_local_1);
        }

        public function set txtfield10(_arg_1:Label):void
        {
            var _local_2:Object = this._269348905txtfield10;
            if (_local_2 !== _arg_1)
            {
                this._269348905txtfield10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtfield10", _local_2, _arg_1));
            };
        }

        public function get finished():int
        {
            return (_finished);
        }

        [Bindable(event="propertyChange")]
        public function get txtfield13():Label
        {
            return (this._269348908txtfield13);
        }

        private function _AchievementDetail_State1_c():State
        {
            var _local_1:State = new State();
            _local_1.name = "normal";
            return (_local_1);
        }

        public function set awardBtn(_arg_1:Button):void
        {
            var _local_2:Object = this._1621978433awardBtn;
            if (_local_2 !== _arg_1)
            {
                this._1621978433awardBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "awardBtn", _local_2, _arg_1));
            };
        }

        private function _AchievementDetail_SetProperty1_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _AchievementDetail_SetProperty1 = _local_1;
            _local_1.name = "x";
            _local_1.value = 5;
            BindingManager.executeBindings(this, "_AchievementDetail_SetProperty1", _AchievementDetail_SetProperty1);
            return (_local_1);
        }

        private function _AchievementDetail_RemoveChild4_i():RemoveChild
        {
            var _local_1:RemoveChild = new RemoveChild();
            _AchievementDetail_RemoveChild4 = _local_1;
            BindingManager.executeBindings(this, "_AchievementDetail_RemoveChild4", _AchievementDetail_RemoveChild4);
            return (_local_1);
        }

        private function _AchievementDetail_SetProperty5_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _AchievementDetail_SetProperty5 = _local_1;
            _local_1.name = "width";
            _local_1.value = 76;
            BindingManager.executeBindings(this, "_AchievementDetail_SetProperty5", _AchievementDetail_SetProperty5);
            return (_local_1);
        }

        private function _AchievementDetail_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():DisplayObject
            {
                return (enumList);
            }, function (_arg_1:DisplayObject):void
            {
                _AchievementDetail_RemoveChild1.target = _arg_1;
            }, "_AchievementDetail_RemoveChild1.target");
            result[0] = binding;
            binding = new Binding(this, function ():DisplayObject
            {
                return (progressList);
            }, function (_arg_1:DisplayObject):void
            {
                _AchievementDetail_RemoveChild2.target = _arg_1;
            }, "_AchievementDetail_RemoveChild2.target");
            result[1] = binding;
            binding = new Binding(this, function ():DisplayObject
            {
                return (txtareaAchieveDesc);
            }, function (_arg_1:DisplayObject):void
            {
                _AchievementDetail_RemoveChild3.target = _arg_1;
            }, "_AchievementDetail_RemoveChild3.target");
            result[2] = binding;
            binding = new Binding(this, function ():DisplayObject
            {
                return (txtareaAchieveDetail);
            }, function (_arg_1:DisplayObject):void
            {
                _AchievementDetail_RemoveChild4.target = _arg_1;
            }, "_AchievementDetail_RemoveChild4.target");
            result[3] = binding;
            binding = new Binding(this, function ():DisplayObject
            {
                return (imageAch);
            }, function (_arg_1:DisplayObject):void
            {
                _AchievementDetail_RemoveChild5.target = _arg_1;
            }, "_AchievementDetail_RemoveChild5.target");
            result[4] = binding;
            binding = new Binding(this, function ():DisplayObject
            {
                return (txtAchieveAward);
            }, function (_arg_1:DisplayObject):void
            {
                _AchievementDetail_RemoveChild6.target = _arg_1;
            }, "_AchievementDetail_RemoveChild6.target");
            result[5] = binding;
            binding = new Binding(this, function ():Object
            {
                return (txtAchieveTime);
            }, function (_arg_1:Object):void
            {
                _AchievementDetail_SetProperty1.target = _arg_1;
            }, "_AchievementDetail_SetProperty1.target");
            result[6] = binding;
            binding = new Binding(this, function ():Object
            {
                return (txtAchieveTime);
            }, function (_arg_1:Object):void
            {
                _AchievementDetail_SetProperty2.target = _arg_1;
            }, "_AchievementDetail_SetProperty2.target");
            result[7] = binding;
            binding = new Binding(this, function ():Object
            {
                return (txtAchieveTime);
            }, function (_arg_1:Object):void
            {
                _AchievementDetail_SetProperty3.target = _arg_1;
            }, "_AchievementDetail_SetProperty3.target");
            result[8] = binding;
            binding = new Binding(this, function ():Object
            {
                return (txtareaAchieveTitle);
            }, function (_arg_1:Object):void
            {
                _AchievementDetail_SetProperty4.target = _arg_1;
            }, "_AchievementDetail_SetProperty4.target");
            result[9] = binding;
            binding = new Binding(this, function ():Object
            {
                return (txtareaAchieveTitle);
            }, function (_arg_1:Object):void
            {
                _AchievementDetail_SetProperty5.target = _arg_1;
            }, "_AchievementDetail_SetProperty5.target");
            result[10] = binding;
            binding = new Binding(this, function ():IStyleClient
            {
                return (txtareaAchieveTitle);
            }, function (_arg_1:IStyleClient):void
            {
                _AchievementDetail_SetStyle1.target = _arg_1;
            }, "_AchievementDetail_SetStyle1.target");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACHIEVEMENTPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                txtareaAchieveTitle.label = _arg_1;
            }, "txtareaAchieveTitle.label");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACHIEVEMENTPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                txtareaAchieveDesc.text = _arg_1;
            }, "txtareaAchieveDesc.text");
            result[13] = binding;
            binding = new Binding(this, function ():Object
            {
                return ((_finished) ? ResManager.ICON_ACHIEVEMENT : ResManager.ICON_ACHIEVEMENT_DISABLED);
            }, function (_arg_1:Object):void
            {
                imageAch.source = _arg_1;
            }, "imageAch.source");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.ACHIEVEMENTPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                txtareaAchieveDetail.text = _arg_1;
            }, "txtareaAchieveDetail.text");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MEDAL_P[31];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                awardBtn.label = _arg_1;
            }, "awardBtn.label");
            result[16] = binding;
            return (result);
        }

        override public function initialize():void
        {
            var target:AchievementDetail;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _AchievementDetail_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_AchievementDetailWatcherSetupUtil");
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

        public function set enumList(_arg_1:Tile):void
        {
            var _local_2:Object = this._2070982337enumList;
            if (_local_2 !== _arg_1)
            {
                this._2070982337enumList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "enumList", _local_2, _arg_1));
            };
        }

        public function get selected():Boolean
        {
            return ((filters) && (filters.length > 0));
        }

        public function showDetail(_arg_1:int, _arg_2:Object=null):void
        {
            var _local_5:Object;
            var _local_6:int;
            var _local_7:int;
            var _local_8:*;
            var _local_9:*;
            var _local_10:Property;
            var _local_3:int;
            if (_arg_2.detail)
            {
                txtareaAchieveDetail.visible = true;
                txtareaAchieveDetail.text = _arg_2.detail;
                _local_3 = (_local_3 + 30);
            }
            else
            {
                txtareaAchieveDetail.includeInLayout = false;
                txtareaAchieveDetail.visible = false;
            };
            imageAch.source = ((_arg_2.finished) ? ResManager.ICON_ACHIEVEMENT : ResManager.ICON_ACHIEVEMENT_DISABLED);
            var _local_4:Object = GameData.d[GamePredef.TBL_ACHIEVEMENT][aid];
            if (((((_arg_2.finished) && (_local_4)) && (_local_4.isAward)) && (Number(_local_4.isAward) > 0)))
            {
                awardBtn.visible = true;
                awardBtn.toolTip = _local_4.desc;
                if (Number(_local_4.isAward) == 1)
                {
                    if ((((_core.takeAchieveAwardLog) && (_core.takeAchieveAwardLog[aid])) && (Number(_core.takeAchieveAwardLog[aid]) > 0)))
                    {
                        awardBtn.visible = false;
                    }
                    else
                    {
                        awardBtn.visible = true;
                    };
                };
            }
            else
            {
                awardBtn.visible = false;
            };
            switch (_arg_1)
            {
                case 0:
                    hideDetail();
                    height = (54 + _local_3);
                    return;
                case 1:
                    enumList.visible = true;
                    enumList.y = (54 + _local_3);
                    _local_5 = _arg_2.enumNameList;
                    _local_6 = 0;
                    for (_local_8 in _local_5)
                    {
                        this[("txtfield" + _local_6)].visible = true;
                        this[("txtfield" + _local_6)].setStyle("color", ((_local_5[_local_8]) ? 0xFF00 : 0xC8C8C8));
                        this[("txtfield" + _local_6)].text = _local_8;
                        _local_6++;
                    };
                    _local_7 = int((22 * Math.ceil((_local_6 / 3))));
                    enumList.height = (enumList.y + _local_7);
                    _local_3 = (_local_3 + _local_7);
                    height = (60 + _local_3);
                    while (_local_6 < _MAX_ENUM_NUM)
                    {
                        this[("txtfield" + _local_6++)].visible = false;
                    };
                    return;
                case 2:
                    progressList.visible = true;
                    if (progressList.numChildren > 0)
                    {
                        progressList.removeAllChildren();
                    };
                    _local_5 = _arg_2.progressNameList;
                    _local_6 = 0;
                    for (_local_9 in _local_5)
                    {
                        _local_10 = new Property();
                        _local_10.m = _local_5[_local_9].m;
                        _local_10.v = _local_5[_local_9].v;
                        _local_10.styleName = "ProgressExp";
                        progressList.y = (50 + _local_3);
                        _local_10.height = 13;
                        _local_10.width = 250;
                        _local_10.color = 0;
                        _local_10.label = ((((_local_9 + ":") + _local_5[_local_9].v) + "/") + _local_5[_local_9].m);
                        progressList.addChild(_local_10);
                        _local_6++;
                    };
                    _local_3 = (_local_3 + (15 * _local_6));
                    height = (54 + _local_3);
                    return;
            };
        }

        public function set txtareaAchieveDesc(_arg_1:Text):void
        {
            var _local_2:Object = this._2009274043txtareaAchieveDesc;
            if (_local_2 !== _arg_1)
            {
                this._2009274043txtareaAchieveDesc = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtareaAchieveDesc", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get awardBtn():Button
        {
            return (this._1621978433awardBtn);
        }

        private function _AchievementDetail_RemoveChild3_i():RemoveChild
        {
            var _local_1:RemoveChild = new RemoveChild();
            _AchievementDetail_RemoveChild3 = _local_1;
            BindingManager.executeBindings(this, "_AchievementDetail_RemoveChild3", _AchievementDetail_RemoveChild3);
            return (_local_1);
        }

        private function _AchievementDetail_SetProperty4_i():SetProperty
        {
            var _local_1:SetProperty = new SetProperty();
            _AchievementDetail_SetProperty4 = _local_1;
            _local_1.name = "x";
            _local_1.value = 1;
            BindingManager.executeBindings(this, "_AchievementDetail_SetProperty4", _AchievementDetail_SetProperty4);
            return (_local_1);
        }

        public function set txtfield2(_arg_1:Label):void
        {
            var _local_2:Object = this._1930973976txtfield2;
            if (_local_2 !== _arg_1)
            {
                this._1930973976txtfield2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtfield2", _local_2, _arg_1));
            };
        }

        public function set txtfield3(_arg_1:Label):void
        {
            var _local_2:Object = this._1930973975txtfield3;
            if (_local_2 !== _arg_1)
            {
                this._1930973975txtfield3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtfield3", _local_2, _arg_1));
            };
        }

        public function set txtfield0(_arg_1:Label):void
        {
            var _local_2:Object = this._1930973978txtfield0;
            if (_local_2 !== _arg_1)
            {
                this._1930973978txtfield0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtfield0", _local_2, _arg_1));
            };
        }

        public function set txtfield1(_arg_1:Label):void
        {
            var _local_2:Object = this._1930973977txtfield1;
            if (_local_2 !== _arg_1)
            {
                this._1930973977txtfield1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtfield1", _local_2, _arg_1));
            };
        }

        public function set txtfield6(_arg_1:Label):void
        {
            var _local_2:Object = this._1930973972txtfield6;
            if (_local_2 !== _arg_1)
            {
                this._1930973972txtfield6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtfield6", _local_2, _arg_1));
            };
        }

        public function set txtfield4(_arg_1:Label):void
        {
            var _local_2:Object = this._1930973974txtfield4;
            if (_local_2 !== _arg_1)
            {
                this._1930973974txtfield4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtfield4", _local_2, _arg_1));
            };
        }

        public function set txtfield8(_arg_1:Label):void
        {
            var _local_2:Object = this._1930973970txtfield8;
            if (_local_2 !== _arg_1)
            {
                this._1930973970txtfield8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtfield8", _local_2, _arg_1));
            };
        }

        public function set progressList(_arg_1:VBox):void
        {
            var _local_2:Object = this._717359211progressList;
            if (_local_2 !== _arg_1)
            {
                this._717359211progressList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "progressList", _local_2, _arg_1));
            };
        }

        public function set txtfield9(_arg_1:Label):void
        {
            var _local_2:Object = this._1930973969txtfield9;
            if (_local_2 !== _arg_1)
            {
                this._1930973969txtfield9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtfield9", _local_2, _arg_1));
            };
        }

        public function set txtfield7(_arg_1:Label):void
        {
            var _local_2:Object = this._1930973971txtfield7;
            if (_local_2 !== _arg_1)
            {
                this._1930973971txtfield7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtfield7", _local_2, _arg_1));
            };
        }

        public function set finished(_arg_1:int):void
        {
            var _local_2:Object;
            _finished = _arg_1;
            if (_finished)
            {
                imageAch.source = ResManager.ICON_ACHIEVEMENT;
                styleName = "CanvasAchDetailFinished";
                txtAchieveAward.setStyle("color", 0xFFFF00);
                txtareaAchieveDesc.setStyle("color", 0xFFFF00);
                _local_2 = GameData.d[GamePredef.TBL_ACHIEVEMENT][aid];
                if ((((_local_2) && (_local_2.isAward)) && (Number(_local_2.isAward) > 0)))
                {
                    awardBtn.visible = true;
                    awardBtn.toolTip = _local_2.desc;
                    if (Number(_local_2.isAward) == 1)
                    {
                        if ((((_core.takeAchieveAwardLog) && (_core.takeAchieveAwardLog[aid])) && (Number(_core.takeAchieveAwardLog[aid]) > 0)))
                        {
                            awardBtn.visible = false;
                        }
                        else
                        {
                            awardBtn.visible = true;
                        };
                    };
                }
                else
                {
                    awardBtn.visible = false;
                };
            }
            else
            {
                imageAch.source = ResManager.ICON_ACHIEVEMENT_DISABLED;
                styleName = "CanvasAchDetail";
                txtareaAchieveTitle.setStyle("color", 0xC8C8C8);
                txtareaAchieveDesc.setStyle("color", 0xC8C8C8);
                txtAchieveAward.setStyle("color", 0xC8C8C8);
                awardBtn.visible = false;
            };
        }

        public function set txtfield5(_arg_1:Label):void
        {
            var _local_2:Object = this._1930973973txtfield5;
            if (_local_2 !== _arg_1)
            {
                this._1930973973txtfield5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtfield5", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get txtfield0():Label
        {
            return (this._1930973978txtfield0);
        }

        [Bindable(event="propertyChange")]
        public function get txtfield1():Label
        {
            return (this._1930973977txtfield1);
        }

        public function __awardBtn_click(_arg_1:MouseEvent):void
        {
            getAchievementAward();
        }

        [Bindable(event="propertyChange")]
        public function get txtfield3():Label
        {
            return (this._1930973975txtfield3);
        }

        [Bindable(event="propertyChange")]
        public function get txtfield4():Label
        {
            return (this._1930973974txtfield4);
        }

        private function getAchievementAward():void
        {
            if (((!(aid)) || (aid == 0)))
            {
                return;
            };
            var _local_1:Object = GameData.d[GamePredef.TBL_ACHIEVEMENT][aid];
            if ((((!(_local_1)) || (!(_local_1.isAward))) || (Number(_local_1.isAward) == 0)))
            {
                return;
            };
            _core.remote.call("getAchieveAward", null, aid);
        }

        [Bindable(event="propertyChange")]
        public function get txtfield8():Label
        {
            return (this._1930973970txtfield8);
        }

        [Bindable(event="propertyChange")]
        public function get txtfield2():Label
        {
            return (this._1930973976txtfield2);
        }

        [Bindable(event="propertyChange")]
        public function get txtfield6():Label
        {
            return (this._1930973972txtfield6);
        }

        [Bindable(event="propertyChange")]
        public function get txtfield7():Label
        {
            return (this._1930973971txtfield7);
        }

        [Bindable(event="propertyChange")]
        public function get txtfield5():Label
        {
            return (this._1930973973txtfield5);
        }

        [Bindable(event="propertyChange")]
        public function get txtfield9():Label
        {
            return (this._1930973969txtfield9);
        }


    }
}//package com.qeedoo.ui.view.comp

