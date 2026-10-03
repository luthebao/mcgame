// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.MCZDBattleReport

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.config.Language;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
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

    public class MCZDBattleReport extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _MCZDBattleReport_BasicGlowButton5:BasicGlowButton;
        public var _MCZDBattleReport_BasicGlowButton6:BasicGlowButton;
        private var _3649t5:RoundedLabel;
        public var _MCZDBattleReport_BasicGlowButton3:BasicGlowButton;
        private var _1464371768txtTitle:BasicTitleCanvas;
        private var _3635re:RoundedLabel;
        private var _3652t8:RoundedLabel;
        private var _3650t6:RoundedLabel;
        private var _98727cpt:RoundedLabel;
        private var _3651t7:RoundedLabel;
        private var _3653t9:RoundedLabel;
        public var _MCZDBattleReport_BasicGlowButton1:BasicGlowButton;
        public var _MCZDBattleReport_BasicGlowButton2:BasicGlowButton;
        public var _MCZDBattleReport_BasicGlowButton4:BasicGlowButton;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":274,
                    "height":330,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"txtTitle"
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"re",
                        "stylesFactory":function ():void
                        {
                            this.top = "35";
                            this.horizontalCenter = "0";
                            this.fontSize = 20;
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"cpt",
                        "stylesFactory":function ():void
                        {
                            this.top = "71";
                            this.horizontalCenter = "0";
                            this.fontSize = 13;
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"t5",
                        "stylesFactory":function ():void
                        {
                            this.left = "33.5";
                            this.top = "105";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"width":132});
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"t6",
                        "stylesFactory":function ():void
                        {
                            this.left = "33.5";
                            this.top = "141";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"width":132});
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"t7",
                        "stylesFactory":function ():void
                        {
                            this.left = "33.5";
                            this.top = "176";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"width":132});
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"t8",
                        "stylesFactory":function ():void
                        {
                            this.left = "33.5";
                            this.top = "213";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"width":132});
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"t9",
                        "stylesFactory":function ():void
                        {
                            this.left = "33.5";
                            this.top = "248";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"width":132});
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_MCZDBattleReport_BasicGlowButton1",
                        "events":{"click":"___MCZDBattleReport_BasicGlowButton1_click"},
                        "stylesFactory":function ():void
                        {
                            this.left = "176.5";
                            this.top = "102";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":64,
                                "styleName":"BtnStdRed"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_MCZDBattleReport_BasicGlowButton2",
                        "events":{"click":"___MCZDBattleReport_BasicGlowButton2_click"},
                        "stylesFactory":function ():void
                        {
                            this.left = "176.5";
                            this.top = "139";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":64,
                                "styleName":"BtnStdRed"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_MCZDBattleReport_BasicGlowButton3",
                        "events":{"click":"___MCZDBattleReport_BasicGlowButton3_click"},
                        "stylesFactory":function ():void
                        {
                            this.left = "176.5";
                            this.top = "174";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":64,
                                "styleName":"BtnStdRed"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_MCZDBattleReport_BasicGlowButton4",
                        "events":{"click":"___MCZDBattleReport_BasicGlowButton4_click"},
                        "stylesFactory":function ():void
                        {
                            this.left = "176.5";
                            this.top = "211";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":64,
                                "styleName":"BtnStdRed"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_MCZDBattleReport_BasicGlowButton5",
                        "events":{"click":"___MCZDBattleReport_BasicGlowButton5_click"},
                        "stylesFactory":function ():void
                        {
                            this.left = "176.5";
                            this.top = "246";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":64,
                                "styleName":"BtnStdRed"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_MCZDBattleReport_BasicGlowButton6",
                        "events":{"click":"___MCZDBattleReport_BasicGlowButton6_click"},
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":285,
                                "styleName":"CrystalBlueButton"
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var bidList:* = [];
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function MCZDBattleReport()
        {
            mx_internal::_document = this;
            this.width = 274;
            this.height = 330;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            MCZDBattleReport._watcherSetupUtil = _arg_1;
        }


        public function showResult(_arg_1:*):void
        {
            this.show();
            cleanResult();
            if (!_arg_1)
            {
                return;
            };
            if (_arg_1.iswin == -1)
            {
                re.text = "匹配超时";
                t5.text = "无法为您找到匹配的对手";
                t6.text = "";
                t7.text = "";
                t8.text = "";
                t9.text = "";
                cpt.text = "";
            };
            if (_arg_1.iswin == 1)
            {
                re.htmlText = "<font color='#00FF00'>挑战胜利</font>";
                cpt.text = _arg_1.cpt;
            };
            if (_arg_1.iswin == 2)
            {
                re.htmlText = "<font color='#FF0000'>挑战失败</font>";
                cpt.text = _arg_1.cpt;
            };
            if (!_arg_1.list)
            {
                return;
            };
            var _local_2:* = _arg_1.list;
            var _local_3:* = 5;
            while (_local_3 < 10)
            {
                if (_local_2[_local_3])
                {
                    bidList[_local_3] = String(_local_2[_local_3].bid);
                    if (_local_2[_local_3].result == 1)
                    {
                        this[("t" + _local_3)].text = (this[("t" + _local_3)].text + ":   胜利");
                    }
                    else
                    {
                        if (_local_2[_local_3].result == 2)
                        {
                            this[("t" + _local_3)].text = (this[("t" + _local_3)].text + ":   失败");
                        };
                    };
                };
                _local_3++;
            };
        }

        public function set t5(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._3649t5;
            if (_local_2 !== _arg_1)
            {
                this._3649t5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "t5", _local_2, _arg_1));
            };
        }

        public function set t7(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._3651t7;
            if (_local_2 !== _arg_1)
            {
                this._3651t7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "t7", _local_2, _arg_1));
            };
        }

        public function set t9(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._3653t9;
            if (_local_2 !== _arg_1)
            {
                this._3653t9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "t9", _local_2, _arg_1));
            };
        }

        public function set t6(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._3650t6;
            if (_local_2 !== _arg_1)
            {
                this._3650t6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "t6", _local_2, _arg_1));
            };
        }

        private function _MCZDBattleReport_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.MCZDPETFIGHT_PANEL_U[58];
            _local_1 = Language.MCZDPETFIGHT_PANEL_U[44];
            _local_1 = Language.MCZDPETFIGHT_PANEL_U[44];
            _local_1 = Language.MCZDPETFIGHT_PANEL_U[44];
            _local_1 = Language.MCZDPETFIGHT_PANEL_U[45];
            _local_1 = Language.MCZDPETFIGHT_PANEL_U[48];
            _local_1 = Language.MCZDPETFIGHT_PANEL_U[46];
            _local_1 = Language.MCZDPETFIGHT_PANEL_U[47];
            _local_1 = Language.MCZDPETFIGHT_PANEL_U[59];
            _local_1 = Language.MCZDPETFIGHT_PANEL_U[59];
            _local_1 = Language.MCZDPETFIGHT_PANEL_U[59];
            _local_1 = Language.MCZDPETFIGHT_PANEL_U[59];
            _local_1 = Language.MCZDPETFIGHT_PANEL_U[59];
            _local_1 = Language.STAR_BATTLE_REPORT[9];
        }

        public function set t8(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._3652t8;
            if (_local_2 !== _arg_1)
            {
                this._3652t8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "t8", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:MCZDBattleReport;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _MCZDBattleReport_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_MCZDBattleReportWatcherSetupUtil");
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

        private function _MCZDBattleReport_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MCZDPETFIGHT_PANEL_U[58];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                txtTitle.text = _arg_1;
            }, "txtTitle.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MCZDPETFIGHT_PANEL_U[44];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                re.text = _arg_1;
            }, "re.text");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MCZDPETFIGHT_PANEL_U[44];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                cpt.text = _arg_1;
            }, "cpt.text");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MCZDPETFIGHT_PANEL_U[44];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                t5.text = _arg_1;
            }, "t5.text");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MCZDPETFIGHT_PANEL_U[45];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                t6.text = _arg_1;
            }, "t6.text");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MCZDPETFIGHT_PANEL_U[48];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                t7.text = _arg_1;
            }, "t7.text");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MCZDPETFIGHT_PANEL_U[46];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                t8.text = _arg_1;
            }, "t8.text");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MCZDPETFIGHT_PANEL_U[47];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                t9.text = _arg_1;
            }, "t9.text");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MCZDPETFIGHT_PANEL_U[59];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MCZDBattleReport_BasicGlowButton1.label = _arg_1;
            }, "_MCZDBattleReport_BasicGlowButton1.label");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MCZDPETFIGHT_PANEL_U[59];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MCZDBattleReport_BasicGlowButton2.label = _arg_1;
            }, "_MCZDBattleReport_BasicGlowButton2.label");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MCZDPETFIGHT_PANEL_U[59];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MCZDBattleReport_BasicGlowButton3.label = _arg_1;
            }, "_MCZDBattleReport_BasicGlowButton3.label");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MCZDPETFIGHT_PANEL_U[59];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MCZDBattleReport_BasicGlowButton4.label = _arg_1;
            }, "_MCZDBattleReport_BasicGlowButton4.label");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MCZDPETFIGHT_PANEL_U[59];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MCZDBattleReport_BasicGlowButton5.label = _arg_1;
            }, "_MCZDBattleReport_BasicGlowButton5.label");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.STAR_BATTLE_REPORT[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MCZDBattleReport_BasicGlowButton6.label = _arg_1;
            }, "_MCZDBattleReport_BasicGlowButton6.label");
            result[13] = binding;
            return (result);
        }

        public function ___MCZDBattleReport_BasicGlowButton2_click(_arg_1:MouseEvent):void
        {
            playRecord(6);
        }

        public function ___MCZDBattleReport_BasicGlowButton4_click(_arg_1:MouseEvent):void
        {
            playRecord(8);
        }

        private function playRecord(_arg_1:*):void
        {
            var _local_2:*;
            if (bidList[_arg_1])
            {
                _local_2 = bidList[_arg_1];
                if (_local_2)
                {
                    _core.replayMCZD = true;
                    _core.remote.call("replayMCZDFight", null, _local_2);
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get cpt():RoundedLabel
        {
            return (this._98727cpt);
        }

        public function ___MCZDBattleReport_BasicGlowButton6_click(_arg_1:MouseEvent):void
        {
            this.hide();
        }

        public function set txtTitle(_arg_1:BasicTitleCanvas):void
        {
            var _local_2:Object = this._1464371768txtTitle;
            if (_local_2 !== _arg_1)
            {
                this._1464371768txtTitle = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtTitle", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get re():RoundedLabel
        {
            return (this._3635re);
        }

        [Bindable(event="propertyChange")]
        public function get t5():RoundedLabel
        {
            return (this._3649t5);
        }

        [Bindable(event="propertyChange")]
        public function get t7():RoundedLabel
        {
            return (this._3651t7);
        }

        [Bindable(event="propertyChange")]
        public function get t8():RoundedLabel
        {
            return (this._3652t8);
        }

        [Bindable(event="propertyChange")]
        public function get t9():RoundedLabel
        {
            return (this._3653t9);
        }

        [Bindable(event="propertyChange")]
        public function get txtTitle():BasicTitleCanvas
        {
            return (this._1464371768txtTitle);
        }

        override public function hide():void
        {
            if (this.visible)
            {
                this.visible = false;
            };
        }

        private function cleanResult():void
        {
            t5.text = Language.MCZDPETFIGHT_PANEL_U[44];
            t6.text = Language.MCZDPETFIGHT_PANEL_U[45];
            t7.text = Language.MCZDPETFIGHT_PANEL_U[46];
            t8.text = Language.MCZDPETFIGHT_PANEL_U[47];
            t9.text = Language.MCZDPETFIGHT_PANEL_U[48];
            re.text = "";
            cpt.text = "";
            bidList = [];
        }

        public function set cpt(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._98727cpt;
            if (_local_2 !== _arg_1)
            {
                this._98727cpt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cpt", _local_2, _arg_1));
            };
        }

        public function ___MCZDBattleReport_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            playRecord(5);
        }

        public function ___MCZDBattleReport_BasicGlowButton3_click(_arg_1:MouseEvent):void
        {
            playRecord(7);
        }

        [Bindable(event="propertyChange")]
        public function get t6():RoundedLabel
        {
            return (this._3650t6);
        }

        public function ___MCZDBattleReport_BasicGlowButton5_click(_arg_1:MouseEvent):void
        {
            playRecord(9);
        }

        public function set re(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._3635re;
            if (_local_2 !== _arg_1)
            {
                this._3635re = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "re", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.comp

