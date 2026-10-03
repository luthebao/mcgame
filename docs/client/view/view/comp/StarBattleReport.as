// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.StarBattleReport

package com.qeedoo.ui.view.comp
{
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.game.config.Language;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import mx.events.FlexEvent;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.view.ViewManager;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.net.Responder;
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

    public class StarBattleReport extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _3614s1:MyButton;
        public var _StarBattleReport_BasicGlowButton1:BasicGlowButton;
        private var _3616s3:MyButton;
        private var _3618s5:MyButton;
        private var _859638800txtDie:Label;
        private var _1464371768txtTitle:BasicTitleCanvas;
        private var _3615s2:MyButton;
        private var _3617s4:MyButton;
        private var _callBack:Function;
        private var _totalScore:uint;
        public var _StarBattleReport_Label1:Label;
        public var _StarBattleReport_Label2:Label;
        public var _StarBattleReport_Label3:Label;
        private var _3059468comm:Label;
        private var _1465478654txtScore:Label;
        private var _878522019txtTime:Label;

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
                        "type":Label,
                        "id":"_StarBattleReport_Label1",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 25;
                            this.color = 16493886;
                            this.fontWeight = "bold";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":24,
                                "y":52
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"_StarBattleReport_Label2",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 25;
                            this.color = 16493886;
                            this.fontWeight = "bold";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":24,
                                "y":95
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"_StarBattleReport_Label3",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 25;
                            this.color = 16752172;
                            this.fontWeight = "bold";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":24,
                                "y":150
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":MyButton,
                        "id":"s1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":47,
                                "y":205,
                                "width":20,
                                "height":20,
                                "orient":true
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":MyButton,
                        "id":"s2",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":87,
                                "y":205,
                                "width":20,
                                "height":20,
                                "orient":true
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":MyButton,
                        "id":"s3",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":127,
                                "y":205,
                                "width":20,
                                "height":20,
                                "orient":true
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":MyButton,
                        "id":"s4",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":167,
                                "y":205,
                                "width":20,
                                "height":20,
                                "orient":true
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":MyButton,
                        "id":"s5",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":207,
                                "y":205,
                                "width":20,
                                "height":20,
                                "orient":true
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "stylesFactory":function ():void
                        {
                            this.fontFamily = "GameNumber";
                            this.fontSize = 25;
                            this.color = 0xFEDD00;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":179,
                                "y":148,
                                "text":"100"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 25;
                            this.color = 0xFEDD00;
                            this.fontWeight = "bold";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":156,
                                "y":150,
                                "text":"/",
                                "width":15
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"txtScore",
                        "stylesFactory":function ():void
                        {
                            this.fontFamily = "GameNumber";
                            this.fontSize = 25;
                            this.color = 0xFEDD00;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":98,
                                "y":148,
                                "text":"100"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"txtTime",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 25;
                            this.color = 0x72FF00;
                            this.fontWeight = "bold";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":145,
                                "y":51,
                                "text":"00:00:00"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"txtDie",
                        "stylesFactory":function ():void
                        {
                            this.fontSize = 25;
                            this.color = 0x72FF00;
                            this.fontWeight = "bold";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":145,
                                "y":95,
                                "text":"0"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Label,
                        "id":"comm",
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                            this.fontSize = 25;
                            this.color = 0xFF00;
                            this.fontWeight = "bold";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"y":240});
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"_StarBattleReport_BasicGlowButton1",
                        "events":{"click":"___StarBattleReport_BasicGlowButton1_click"},
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
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function StarBattleReport()
        {
            mx_internal::_document = this;
            this.width = 274;
            this.height = 330;
            this.styleName = "StandardContent";
            this.addEventListener("creationComplete", ___StarBattleReport_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            StarBattleReport._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get txtScore():Label
        {
            return (this._1465478654txtScore);
        }

        public function set txtScore(_arg_1:Label):void
        {
            var _local_2:Object = this._1465478654txtScore;
            if (_local_2 !== _arg_1)
            {
                this._1465478654txtScore = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtScore", _local_2, _arg_1));
            };
        }

        private function showWarStarAndComment(_arg_1:Number):void
        {
            var _local_2:int = 1;
            if (_arg_1 > 90)
            {
                _local_2 = 5;
                comm.text = Language.STAR_BATTLE_REPORT[1];
            }
            else
            {
                if (_arg_1 > 80)
                {
                    _local_2 = 4;
                    comm.text = Language.STAR_BATTLE_REPORT[2];
                }
                else
                {
                    if (_arg_1 > 60)
                    {
                        _local_2 = 3;
                        comm.text = Language.STAR_BATTLE_REPORT[3];
                    }
                    else
                    {
                        if (_arg_1 > 30)
                        {
                            _local_2 = 2;
                            comm.text = Language.STAR_BATTLE_REPORT[4];
                        }
                        else
                        {
                            comm.text = Language.STAR_BATTLE_REPORT[5];
                        };
                    };
                };
            };
            var _local_3:int = 1;
            while (_local_3 <= 5)
            {
                if (_local_2 >= _local_3)
                {
                    this[("s" + _local_3)].enabled = true;
                    this[("s" + _local_3)].progress = 1;
                }
                else
                {
                    this[("s" + _local_3)].enabled = false;
                };
                _local_3++;
            };
        }

        override public function initialize():void
        {
            var target:StarBattleReport;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _StarBattleReport_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_StarBattleReportWatcherSetupUtil");
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
        public function get comm():Label
        {
            return (this._3059468comm);
        }

        public function ___StarBattleReport_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        private function exit():void
        {
            if (_callBack)
            {
                _callBack();
            };
        }

        private function init():void
        {
        }

        [Bindable(event="propertyChange")]
        public function get s3():MyButton
        {
            return (this._3616s3);
        }

        [Bindable(event="propertyChange")]
        public function get s4():MyButton
        {
            return (this._3617s4);
        }

        private function _StarBattleReport_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.STAR_BATTLE_REPORT[6];
            _local_1 = Language.STAR_BATTLE_REPORT[7];
            _local_1 = Language.STAR_BATTLE_REPORT[8];
            _local_1 = ResManager.IMG_STARS_INS_LIGHT;
            _local_1 = ResManager.IMG_STARS_INS_LIGHT;
            _local_1 = ResManager.IMG_STARS_INS_LIGHT;
            _local_1 = ResManager.IMG_STARS_INS_LIGHT;
            _local_1 = ResManager.IMG_STARS_INS_LIGHT;
            _local_1 = Language.STAR_BATTLE_REPORT[9];
        }

        [Bindable(event="propertyChange")]
        public function get s1():MyButton
        {
            return (this._3614s1);
        }

        [Bindable(event="propertyChange")]
        public function get s2():MyButton
        {
            return (this._3615s2);
        }

        public function set comm(_arg_1:Label):void
        {
            var _local_2:Object = this._3059468comm;
            if (_local_2 !== _arg_1)
            {
                this._3059468comm = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "comm", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get s5():MyButton
        {
            return (this._3618s5);
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

        private function updateMyButtonProgress(_arg_1:Number):void
        {
            var _local_2:int = 1;
            while (_local_2 <= 5)
            {
                if (_arg_1 >= (_local_2 * 20))
                {
                    this[("s" + _local_2)].enabled = true;
                    this[("s" + _local_2)].progress = 1;
                }
                else
                {
                    this[("s" + _local_2)].enabled = false;
                };
                _local_2++;
            };
        }

        public function set txtTime(_arg_1:Label):void
        {
            var _local_2:Object = this._878522019txtTime;
            if (_local_2 !== _arg_1)
            {
                this._878522019txtTime = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtTime", _local_2, _arg_1));
            };
        }

        public function set s1(_arg_1:MyButton):void
        {
            var _local_2:Object = this._3614s1;
            if (_local_2 !== _arg_1)
            {
                this._3614s1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "s1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get txtTitle():BasicTitleCanvas
        {
            return (this._1464371768txtTitle);
        }

        private function onResultHandler(_arg_1:*):void
        {
            txtTitle.text = Language.STAR_BATTLE_REPORT[0];
            if (_arg_1.r == 1)
            {
                totalScore = _arg_1.s.score;
                txtTime.text = getTimeBySec(Math.round((_arg_1.s.time / 1000)));
                txtDie.text = ((_arg_1.s.die) ? _arg_1.s.die : "0");
                _core.view.getUI(ViewManager.POPU_STAR_INSTACE_MAP).setOneStar(_arg_1.s.id, _arg_1.s.level, _arg_1.s.score);
            };
        }

        public function set s3(_arg_1:MyButton):void
        {
            var _local_2:Object = this._3616s3;
            if (_local_2 !== _arg_1)
            {
                this._3616s3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "s3", _local_2, _arg_1));
            };
        }

        override public function hide():void
        {
            if (this.visible)
            {
                this.visible = false;
                exit();
            };
        }

        public function set s5(_arg_1:MyButton):void
        {
            var _local_2:Object = this._3618s5;
            if (_local_2 !== _arg_1)
            {
                this._3618s5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "s5", _local_2, _arg_1));
            };
        }

        private function _StarBattleReport_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.STAR_BATTLE_REPORT[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _StarBattleReport_Label1.text = _arg_1;
            }, "_StarBattleReport_Label1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.STAR_BATTLE_REPORT[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _StarBattleReport_Label2.text = _arg_1;
            }, "_StarBattleReport_Label2.text");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.STAR_BATTLE_REPORT[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _StarBattleReport_Label3.text = _arg_1;
            }, "_StarBattleReport_Label3.text");
            result[2] = binding;
            binding = new Binding(this, function ():Class
            {
                return (ResManager.IMG_STARS_INS_LIGHT);
            }, function (_arg_1:Class):void
            {
                s1.skin = _arg_1;
            }, "s1.skin");
            result[3] = binding;
            binding = new Binding(this, function ():Class
            {
                return (ResManager.IMG_STARS_INS_LIGHT);
            }, function (_arg_1:Class):void
            {
                s2.skin = _arg_1;
            }, "s2.skin");
            result[4] = binding;
            binding = new Binding(this, function ():Class
            {
                return (ResManager.IMG_STARS_INS_LIGHT);
            }, function (_arg_1:Class):void
            {
                s3.skin = _arg_1;
            }, "s3.skin");
            result[5] = binding;
            binding = new Binding(this, function ():Class
            {
                return (ResManager.IMG_STARS_INS_LIGHT);
            }, function (_arg_1:Class):void
            {
                s4.skin = _arg_1;
            }, "s4.skin");
            result[6] = binding;
            binding = new Binding(this, function ():Class
            {
                return (ResManager.IMG_STARS_INS_LIGHT);
            }, function (_arg_1:Class):void
            {
                s5.skin = _arg_1;
            }, "s5.skin");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.STAR_BATTLE_REPORT[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _StarBattleReport_BasicGlowButton1.label = _arg_1;
            }, "_StarBattleReport_BasicGlowButton1.label");
            result[8] = binding;
            return (result);
        }

        public function set s2(_arg_1:MyButton):void
        {
            var _local_2:Object = this._3615s2;
            if (_local_2 !== _arg_1)
            {
                this._3615s2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "s2", _local_2, _arg_1));
            };
        }

        private function set totalScore(num:uint):void
        {
            var currentScore:uint;
            var onEnter:Function;
            _totalScore = num;
            currentScore = 0;
            onEnter = function (_arg_1:Event):void
            {
                if (++currentScore < _totalScore)
                {
                    txtScore.text = currentScore.toString();
                    currentScore++;
                }
                else
                {
                    _arg_1.currentTarget.removeEventListener(Event.ENTER_FRAME, onEnter);
                    txtScore.text = _totalScore.toString();
                };
            };
            showWarStarAndComment(_totalScore);
            this.addEventListener(Event.ENTER_FRAME, onEnter);
        }

        [Bindable(event="propertyChange")]
        public function get txtTime():Label
        {
            return (this._878522019txtTime);
        }

        public function set s4(_arg_1:MyButton):void
        {
            var _local_2:Object = this._3617s4;
            if (_local_2 !== _arg_1)
            {
                this._3617s4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "s4", _local_2, _arg_1));
            };
        }

        public function ___StarBattleReport_BasicGlowButton1_click(_arg_1:MouseEvent):void
        {
            this.hide();
        }

        [Bindable(event="propertyChange")]
        public function get txtDie():Label
        {
            return (this._859638800txtDie);
        }

        private function getTimeBySec(_arg_1:uint):String
        {
            var _local_3:uint;
            var _local_4:uint;
            var _local_2:* = "";
            if (_arg_1 > 3600)
            {
                _local_3 = uint(Math.floor((_arg_1 / 3600)));
                _local_4 = uint(Math.floor(((_arg_1 - (3600 * _local_3)) / 60)));
                _arg_1 = ((_arg_1 - (_local_3 * 3600)) - (_local_4 * 60));
                _local_2 = ((((_local_3 + ":") + _local_4) + ":") + _arg_1);
            }
            else
            {
                _local_4 = uint(Math.floor((_arg_1 / 60)));
                _arg_1 = (_arg_1 - (_local_4 * 60));
                _local_2 = ((((_local_4 < 10) ? ("0" + _local_4) : _local_4) + ":") + ((_arg_1 < 10) ? ("0" + _arg_1) : _arg_1));
            };
            return (_local_2);
        }

        public function set txtDie(_arg_1:Label):void
        {
            var _local_2:Object = this._859638800txtDie;
            if (_local_2 !== _arg_1)
            {
                this._859638800txtDie = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtDie", _local_2, _arg_1));
            };
        }

        public function showResult(_arg_1:Function):void
        {
            this.show();
            _core.remote.call("battlePlayEnd", new Responder(onResultHandler));
            this._callBack = _arg_1;
        }


    }
}//package com.qeedoo.ui.view.comp

