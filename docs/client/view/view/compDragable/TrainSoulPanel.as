// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.TrainSoulPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Text;
    import flash.display.MovieClip;
    import mx.controls.Image;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.ColorProgressBar;
    import mx.controls.Alert;
    import mx.core.UIComponent;
    import com.qeedoo.ui.view.comp.FilterButton;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import mx.events.FlexEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import flash.events.MouseEvent;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import style.Assets;
    import mx.managers.PopUpManager;
    import com.qeedoo.ui.utils.LanguageUtil;
    import flash.events.Event;
    import flash.net.Responder;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.resource.ResCacher;
    import flash.display.LoaderInfo;
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

    public class TrainSoulPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private const RES_CODE:Number = 2080130102009;
        private const MAX_SOUL_LVL:int = 100;
        private const MIN_LVL:int = 50;
        private var _1401550734rightProp1:Text;
        private var _soulMovie:MovieClip;
        public var _TrainSoulPanel_Image1:Image;
        public var _TrainSoulPanel_Label1:Label;
        public var _TrainSoulPanel_Label2:Label;
        private var _3211823levelProgress:ColorProgressBar;
        public var _TrainSoulPanel_Label4:Label;
        private var _helpAlert:Alert;
        private var _1718064942leftHint:Label;
        private var _1569478973rightHint:Label;
        private var _1401550733rightProp2:Text;
        private var _1541417732movieHolder:UIComponent;
        private var _1728062823leftProp1:Text;
        private var _1656229167levelText:Label;
        private var _1728062824leftProp2:Text;
        public var _TrainSoulPanel_FilterButton1:FilterButton;
        public var _TrainSoulPanel_Text5:Text;
        public var _TrainSoulPanel_BasicTitleCanvas1:BasicTitleCanvas;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":460,
                    "height":450,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_TrainSoulPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":15,
                                "y":40,
                                "styleName":"CanvasBorder",
                                "width":430,
                                "height":395,
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off",
                                "clipContent":false,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_TrainSoulPanel_Label1",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFF00;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":10
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":UIComponent,
                                    "id":"movieHolder",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "percentWidth":100,
                                            "percentHeight":100
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"_TrainSoulPanel_Image1",
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "15";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "rotation":90,
                                            "y":240
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":10,
                                            "y":185,
                                            "styleName":"CanvasBorder",
                                            "width":190,
                                            "height":125,
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "clipContent":false,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_TrainSoulPanel_Label2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalCenter = "0";
                                                    this.color = 0xFFFF00;
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"y":10});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"leftHint",
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalCenter = "0";
                                                    this.color = 0xFFFFFF;
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":30,
                                                        "visible":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Text,
                                                "id":"leftProp1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":21,
                                                        "y":30,
                                                        "mouseEnabled":false,
                                                        "mouseChildren":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Text,
                                                "id":"leftProp2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":101,
                                                        "y":30,
                                                        "mouseEnabled":false,
                                                        "mouseChildren":false
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":230,
                                            "y":185,
                                            "styleName":"CanvasBorder",
                                            "width":190,
                                            "height":125,
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "clipContent":false,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_TrainSoulPanel_Label4",
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalCenter = "0";
                                                    this.color = 0xFFFF00;
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({"y":10});
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"rightHint",
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalCenter = "0";
                                                    this.color = 0xFFFFFF;
                                                    this.textAlign = "center";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":30,
                                                        "visible":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Text,
                                                "id":"rightProp1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":21,
                                                        "y":30,
                                                        "mouseEnabled":false,
                                                        "mouseChildren":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Text,
                                                "id":"rightProp2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":101,
                                                        "y":30,
                                                        "mouseEnabled":false,
                                                        "mouseChildren":false
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"levelText",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":70,
                                            "y":326
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ColorProgressBar,
                                    "id":"levelProgress",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":110,
                                            "y":325,
                                            "width":250,
                                            "height":17,
                                            "upColor":0xFF00FF
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":FilterButton,
                                    "id":"_TrainSoulPanel_FilterButton1",
                                    "events":{"click":"___TrainSoulPanel_FilterButton1_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":355,
                                            "height":23,
                                            "styleName":"BtnStdGreen"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"_TrainSoulPanel_Text5",
                                    "events":{"click":"___TrainSoulPanel_Text5_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":360,
                                            "y":360,
                                            "selectable":false
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

        public function TrainSoulPanel()
        {
            mx_internal::_document = this;
            this.width = 460;
            this.height = 450;
            this.styleName = "StandardContent";
            this.addEventListener("creationComplete", ___TrainSoulPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            TrainSoulPanel._watcherSetupUtil = _arg_1;
        }


        public function set rightHint(_arg_1:Label):void
        {
            var _local_2:Object = this._1569478973rightHint;
            if (_local_2 !== _arg_1)
            {
                this._1569478973rightHint = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rightHint", _local_2, _arg_1));
            };
        }

        public function set movieHolder(_arg_1:UIComponent):void
        {
            var _local_2:Object = this._1541417732movieHolder;
            if (_local_2 !== _arg_1)
            {
                this._1541417732movieHolder = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "movieHolder", _local_2, _arg_1));
            };
        }

        public function ___TrainSoulPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            updateView();
        }

        [Bindable(event="propertyChange")]
        public function get movieHolder():UIComponent
        {
            return (this._1541417732movieHolder);
        }

        private function updateView():void
        {
            this.updateMovie();
            this.updateProperty();
            this.updateProgress();
        }

        override public function initialize():void
        {
            var target:TrainSoulPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _TrainSoulPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_TrainSoulPanelWatcherSetupUtil");
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

        public function ___TrainSoulPanel_FilterButton1_click(_arg_1:MouseEvent):void
        {
            soulHandler(_arg_1);
        }

        private function updateProgress():void
        {
            var _local_2:Object;
            var _local_3:Number;
            var _local_4:int;
            var _local_5:Object;
            var _local_6:Number;
            var _local_7:Number;
            var _local_1:int = _core.player.trainSoulLvl;
            levelText.text = (Language.TRAIN_SOUL_PANEL[4] + _local_1);
            if (_local_1 >= MAX_SOUL_LVL)
            {
                _local_2 = GameData.d[GamePredef.TBL_SOUL][MAX_SOUL_LVL];
                _local_3 = _local_2.requireNum;
                levelProgress.setProgress(_local_3, _local_3);
            }
            else
            {
                _local_4 = (_local_1 + 1);
                _local_5 = GameData.d[GamePredef.TBL_SOUL][_local_4];
                _local_6 = _local_5.requireNum;
                _local_7 = _core.player.trainSoulExp;
                levelProgress.setProgress(_local_7, _local_6);
            };
        }

        public function set levelProgress(_arg_1:ColorProgressBar):void
        {
            var _local_2:Object = this._3211823levelProgress;
            if (_local_2 !== _arg_1)
            {
                this._3211823levelProgress = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "levelProgress", _local_2, _arg_1));
            };
        }

        public function set levelText(_arg_1:Label):void
        {
            var _local_2:Object = this._1656229167levelText;
            if (_local_2 !== _arg_1)
            {
                this._1656229167levelText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "levelText", _local_2, _arg_1));
            };
        }

        private function _TrainSoulPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.TRAIN_SOUL_PANEL[0];
            _local_1 = (Language.TRAIN_SOUL_PANEL[1] + _core.player.mysteryCrystal);
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Assets.UP_ARROW;
            _local_1 = Language.TRAIN_SOUL_PANEL[2];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.TRAIN_SOUL_PANEL[8];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.TRAIN_SOUL_PANEL[3];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.TRAIN_SOUL_PANEL[9];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.TRAIN_SOUL_PANEL[5];
            _local_1 = Language.TRAIN_SOUL_PANEL[0];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.TRAIN_SOUL_PANEL[6];
        }

        [Bindable(event="propertyChange")]
        public function get leftHint():Label
        {
            return (this._1718064942leftHint);
        }

        private function updateProperty():void
        {
            var _local_7:Object;
            var _local_8:int;
            var _local_9:int;
            var _local_10:Number;
            var _local_11:Object;
            var _local_1:int = _core.player.trainSoulLvl;
            var _local_2:* = "";
            var _local_3:* = "";
            if (_local_1 <= 0)
            {
                _local_1 = 0;
                leftHint.visible = true;
            }
            else
            {
                leftHint.visible = false;
                _local_7 = GameData.d[GamePredef.TBL_SOUL][_local_1];
                _local_8 = 1;
                while (_local_8 <= 10)
                {
                    _local_9 = _local_7[("prop" + _local_8)];
                    _local_10 = _local_7[("propNum" + _local_8)];
                    if ((_local_8 % 2) == 1)
                    {
                        _local_2 = (_local_2 + (((((_local_2) ? "\n" : "") + GamePredef.AWAKEN_PROP_DICT[_local_9]) + "+") + _local_10));
                    }
                    else
                    {
                        _local_3 = (_local_3 + (((((_local_3) ? "\n" : "") + GamePredef.AWAKEN_PROP_DICT[_local_9]) + "+") + _local_10));
                    };
                    _local_8++;
                };
            };
            leftProp1.htmlText = _local_2;
            leftProp2.htmlText = _local_3;
            var _local_4:int = (_local_1 + 1);
            var _local_5:* = "";
            var _local_6:* = "";
            if (_local_4 > MAX_SOUL_LVL)
            {
                rightHint.visible = true;
            }
            else
            {
                rightHint.visible = false;
                _local_11 = GameData.d[GamePredef.TBL_SOUL][_local_4];
                _local_8 = 1;
                while (_local_8 <= 10)
                {
                    _local_9 = _local_11[("prop" + _local_8)];
                    _local_10 = _local_11[("propNum" + _local_8)];
                    if ((_local_8 % 2) == 1)
                    {
                        _local_5 = (_local_5 + (((((_local_5) ? "\n" : "") + GamePredef.AWAKEN_PROP_DICT[_local_9]) + "+") + _local_10));
                    }
                    else
                    {
                        _local_6 = (_local_6 + (((((_local_6) ? "\n" : "") + GamePredef.AWAKEN_PROP_DICT[_local_9]) + "+") + _local_10));
                    };
                    _local_8++;
                };
            };
            rightProp1.htmlText = _local_5;
            rightProp2.htmlText = _local_6;
        }

        private function onSoulChange(_arg_1:Object=null):void
        {
            if (!_arg_1)
            {
                return;
            };
            _core.player.trainSoulLvl = _arg_1.soulLvl;
            _core.player.trainSoulExp = _arg_1.soulExp;
            this.updateView();
        }

        [Bindable(event="propertyChange")]
        public function get rightHint():Label
        {
            return (this._1569478973rightHint);
        }

        private function helpHandler(_arg_1:Event):void
        {
            _arg_1.stopImmediatePropagation();
            if (_helpAlert)
            {
                PopUpManager.removePopUp(_helpAlert);
                _helpAlert = null;
            };
            var _local_2:String = Language.TRAIN_SOUL_PANEL[7];
            _helpAlert = Alert.show(LanguageUtil.html2PlainText(_local_2), "", Alert.YES);
            _helpAlert.mx_internal::alertForm.mx_internal::textField.htmlText = _local_2;
        }

        public function set leftProp1(_arg_1:Text):void
        {
            var _local_2:Object = this._1728062823leftProp1;
            if (_local_2 !== _arg_1)
            {
                this._1728062823leftProp1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "leftProp1", _local_2, _arg_1));
            };
        }

        public function set leftProp2(_arg_1:Text):void
        {
            var _local_2:Object = this._1728062824leftProp2;
            if (_local_2 !== _arg_1)
            {
                this._1728062824leftProp2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "leftProp2", _local_2, _arg_1));
            };
        }

        private function soulHandler(_arg_1:Event):void
        {
            _arg_1.stopImmediatePropagation();
            if (_core.player.mysteryCrystal <= 0)
            {
                return;
            };
            if (_core.player.trainSoulLvl >= MAX_SOUL_LVL)
            {
                _core.sysMidNote(Language.TRAIN_SOUL_PANEL[10]);
                return;
            };
            _core.remote.call("trainSoul", new Responder(onSoulChange));
        }

        [Bindable(event="propertyChange")]
        public function get levelProgress():ColorProgressBar
        {
            return (this._3211823levelProgress);
        }

        public function ___TrainSoulPanel_Text5_click(_arg_1:MouseEvent):void
        {
            helpHandler(_arg_1);
        }

        public function set leftHint(_arg_1:Label):void
        {
            var _local_2:Object = this._1718064942leftHint;
            if (_local_2 !== _arg_1)
            {
                this._1718064942leftHint = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "leftHint", _local_2, _arg_1));
            };
        }

        public function set rightProp1(_arg_1:Text):void
        {
            var _local_2:Object = this._1401550734rightProp1;
            if (_local_2 !== _arg_1)
            {
                this._1401550734rightProp1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rightProp1", _local_2, _arg_1));
            };
        }

        public function set rightProp2(_arg_1:Text):void
        {
            var _local_2:Object = this._1401550733rightProp2;
            if (_local_2 !== _arg_1)
            {
                this._1401550733rightProp2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rightProp2", _local_2, _arg_1));
            };
        }

        private function updateMovie():void
        {
            var soulStep:int;
            var soulUrl:String;
            var onLoadMovie:Function;
            soulStep = ((_core.player.trainSoulLvl) || (1));
            if (!_soulMovie)
            {
                soulUrl = ResManager.getResUrl(RES_CODE);
                _soulMovie = (ResCacher.getInstance().getRes(soulUrl) as MovieClip);
                if (!_soulMovie)
                {
                    onLoadMovie = function (_arg_1:Event):void
                    {
                        var _local_2:LoaderInfo = ResCacher.getInstance().current_complete_loader;
                        if (_local_2.url.indexOf(soulUrl) == -1)
                        {
                            return;
                        };
                        ResCacher.getInstance().removeEventListener("complete", onLoadMovie);
                        _soulMovie = (_arg_1.target.current_complete_loader.content as MovieClip);
                        addUpMovie();
                        _soulMovie.gotoAndStop(soulStep);
                    };
                    ResCacher.getInstance().addEventListener("complete", onLoadMovie);
                    return;
                };
                addUpMovie();
            };
            _soulMovie.gotoAndStop(soulStep);
        }

        [Bindable(event="propertyChange")]
        public function get leftProp2():Text
        {
            return (this._1728062824leftProp2);
        }

        [Bindable(event="propertyChange")]
        public function get levelText():Label
        {
            return (this._1656229167levelText);
        }

        [Bindable(event="propertyChange")]
        public function get leftProp1():Text
        {
            return (this._1728062823leftProp1);
        }

        [Bindable(event="propertyChange")]
        public function get rightProp1():Text
        {
            return (this._1401550734rightProp1);
        }

        [Bindable(event="propertyChange")]
        public function get rightProp2():Text
        {
            return (this._1401550733rightProp2);
        }

        private function addUpMovie():void
        {
            _soulMovie.x = ((movieHolder.width - _soulMovie.width) >> 1);
            _soulMovie.y = -10;
            movieHolder.addChild(_soulMovie);
        }

        override public function show():void
        {
            super.show();
            ((initialized) && (updateView()));
        }

        private function _TrainSoulPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TRAIN_SOUL_PANEL[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TrainSoulPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_TrainSoulPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = (Language.TRAIN_SOUL_PANEL[1] + _core.player.mysteryCrystal);
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TrainSoulPanel_Label1.text = _arg_1;
            }, "_TrainSoulPanel_Label1.text");
            result[1] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _TrainSoulPanel_Label1.filters = _arg_1;
            }, "_TrainSoulPanel_Label1.filters");
            result[2] = binding;
            binding = new Binding(this, function ():Object
            {
                return (Assets.UP_ARROW);
            }, function (_arg_1:Object):void
            {
                _TrainSoulPanel_Image1.source = _arg_1;
            }, "_TrainSoulPanel_Image1.source");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TRAIN_SOUL_PANEL[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TrainSoulPanel_Label2.text = _arg_1;
            }, "_TrainSoulPanel_Label2.text");
            result[4] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _TrainSoulPanel_Label2.filters = _arg_1;
            }, "_TrainSoulPanel_Label2.filters");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TRAIN_SOUL_PANEL[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                leftHint.text = _arg_1;
            }, "leftHint.text");
            result[6] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                leftHint.filters = _arg_1;
            }, "leftHint.filters");
            result[7] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                leftProp1.filters = _arg_1;
            }, "leftProp1.filters");
            result[8] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                leftProp2.filters = _arg_1;
            }, "leftProp2.filters");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TRAIN_SOUL_PANEL[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TrainSoulPanel_Label4.text = _arg_1;
            }, "_TrainSoulPanel_Label4.text");
            result[10] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _TrainSoulPanel_Label4.filters = _arg_1;
            }, "_TrainSoulPanel_Label4.filters");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TRAIN_SOUL_PANEL[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                rightHint.text = _arg_1;
            }, "rightHint.text");
            result[12] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                rightHint.filters = _arg_1;
            }, "rightHint.filters");
            result[13] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                rightProp1.filters = _arg_1;
            }, "rightProp1.filters");
            result[14] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                rightProp2.filters = _arg_1;
            }, "rightProp2.filters");
            result[15] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                levelText.filters = _arg_1;
            }, "levelText.filters");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TRAIN_SOUL_PANEL[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                levelProgress.title = _arg_1;
            }, "levelProgress.title");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TRAIN_SOUL_PANEL[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TrainSoulPanel_FilterButton1.label = _arg_1;
            }, "_TrainSoulPanel_FilterButton1.label");
            result[18] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _TrainSoulPanel_FilterButton1.filters = _arg_1;
            }, "_TrainSoulPanel_FilterButton1.filters");
            result[19] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _TrainSoulPanel_Text5.filters = _arg_1;
            }, "_TrainSoulPanel_Text5.filters");
            result[20] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TRAIN_SOUL_PANEL[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _TrainSoulPanel_Text5.htmlText = _arg_1;
            }, "_TrainSoulPanel_Text5.htmlText");
            result[21] = binding;
            return (result);
        }


    }
}//package com.qeedoo.ui.view.compDragable

