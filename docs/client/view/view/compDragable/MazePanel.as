// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.MazePanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Image;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import mx.controls.Button;
    import com.qeedoo.ui.view.comp.IntroText;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import mx.events.FlexEvent;
    import mx.controls.Alert;
    import com.qeedoo.game.config.Language;
    import flash.net.Responder;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.view.ViewManager;
    import flash.events.MouseEvent;
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

    public class MazePanel extends DragableCanvas implements IBindingClient 
    {

        public static const img1:Class = MazePanel_img1;
        public static const img2:Class = MazePanel_img2;
        public static const img3:Class = MazePanel_img3;
        public static const img4:Class = MazePanel_img4;
        public static const img5:Class = MazePanel_img5;
        public static const img6:Class = MazePanel_img6;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _level:int = 1;
        private var _1185250762image1:Image;
        private var _1133599785currentLevelLabel:RoundedLabel;
        private var _428894166enterButton:Button;
        public var _MazePanel_RoundedLabel3:RoundedLabel;
        public var _MazePanel_RoundedLabel5:RoundedLabel;
        public var _MazePanel_RoundedLabel7:RoundedLabel;
        public var _MazePanel_RoundedLabel8:RoundedLabel;
        public var _MazePanel_RoundedLabel9:RoundedLabel;
        private var _3059661cost:RoundedLabel;
        private var _1185250758image5:Image;
        private var _cost:int = 5;
        private var _1185250761image2:Image;
        public var _MazePanel_RoundedLabel10:RoundedLabel;
        public var _MazePanel_RoundedLabel11:RoundedLabel;
        private var _2033767917refreshButton:Button;
        private var _freeRefreshNum:* = 0;
        private var _maxLevel:int = 5;
        private var _1185250759image4:Image;
        private var _1521838490enterNumRemain:RoundedLabel;
        private var _1859786879eventContent:IntroText;
        private var _674573239refreshNumFree:RoundedLabel;
        public var _MazePanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _1185250760image3:Image;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":586,
                    "height":388,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_MazePanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"currentLevelLabel",
                        "stylesFactory":function ():void
                        {
                            this.left = "15.5";
                            this.right = "15.5";
                            this.top = "40";
                            this.horizontalCenter = "0";
                            this.textAlign = "center";
                            this.fontStyle = "normal";
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.left = "15.5";
                            this.right = "15.5";
                            this.top = "52";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "height":160,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"image1",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "17.5";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":100,
                                            "height":140,
                                            "y":10
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"image2",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":100,
                                            "height":140,
                                            "x":127.5,
                                            "y":10
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"image3",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":100,
                                            "height":140,
                                            "x":232.5,
                                            "y":10
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"image4",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":100,
                                            "height":140,
                                            "x":337.5,
                                            "y":10
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"image5",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":100,
                                            "height":140,
                                            "x":442.5,
                                            "y":10
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"cost",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                            this.fontSize = 12;
                            this.fontStyle = "normal";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":385,
                                "y":355
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"_MazePanel_RoundedLabel3",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                            this.fontSize = 12;
                            this.textAlign = "center";
                            this.fontStyle = "normal";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":358,
                                "y":225,
                                "visible":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"refreshNumFree",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                            this.fontSize = 12;
                            this.textAlign = "center";
                            this.fontStyle = "normal";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":473,
                                "y":225,
                                "visible":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"_MazePanel_RoundedLabel5",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                            this.fontSize = 12;
                            this.textAlign = "center";
                            this.fontStyle = "normal";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":358,
                                "y":243
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"enterNumRemain",
                        "stylesFactory":function ():void
                        {
                            this.color = 0xFFFFFF;
                            this.fontSize = 12;
                            this.textAlign = "center";
                            this.fontStyle = "normal";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":473,
                                "y":243
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.left = "15.5";
                            this.right = "15.5";
                            this.top = "222";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "height":140,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":IntroText,
                                    "id":"eventContent",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "10";
                                        this.top = "10";
                                        this.right = "10";
                                        this.bottom = "10";
                                        this.fontSize = 12;
                                        this.color = 0xFFFFFF;
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"enterButton",
                        "events":{"click":"__enterButton_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnStdRed",
                                "height":20,
                                "width":65,
                                "y":355,
                                "x":227.5
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "id":"refreshButton",
                        "events":{"click":"__refreshButton_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnStdRed",
                                "height":20,
                                "width":65,
                                "y":355,
                                "x":318.5
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"_MazePanel_RoundedLabel7",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "center";
                            this.fontStyle = "normal";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":206,
                                "x":34
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"_MazePanel_RoundedLabel8",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "center";
                            this.fontStyle = "normal";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":143,
                                "y":206
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"_MazePanel_RoundedLabel9",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "center";
                            this.fontStyle = "normal";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":249,
                                "y":206
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"_MazePanel_RoundedLabel10",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "center";
                            this.fontStyle = "normal";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":353,
                                "y":206
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"_MazePanel_RoundedLabel11",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "center";
                            this.fontStyle = "normal";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":461,
                                "y":206
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

        public function MazePanel()
        {
            mx_internal::_document = this;
            this.width = 586;
            this.height = 388;
            this.styleName = "StandardContent";
            this.cacheAsBitmap = true;
            this.addEventListener("creationComplete", ___MazePanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            MazePanel._watcherSetupUtil = _arg_1;
        }


        public function set image5(_arg_1:Image):void
        {
            var _local_2:Object = this._1185250758image5;
            if (_local_2 !== _arg_1)
            {
                this._1185250758image5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "image5", _local_2, _arg_1));
            };
        }

        public function set image3(_arg_1:Image):void
        {
            var _local_2:Object = this._1185250760image3;
            if (_local_2 !== _arg_1)
            {
                this._1185250760image3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "image3", _local_2, _arg_1));
            };
        }

        public function ___MazePanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initView();
        }

        public function showPanel():void
        {
            if (_core.player.level < 120)
            {
                Alert.show(Language.MAZE_PANEL_U[29]);
                return;
            };
            _core.remote.call("getMazePreDate", new Responder(onGetMazePreData), null);
            this.visible = true;
        }

        [Bindable(event="propertyChange")]
        public function get refreshButton():Button
        {
            return (this._2033767917refreshButton);
        }

        override public function initialize():void
        {
            var target:MazePanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _MazePanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_MazePanelWatcherSetupUtil");
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

        public function set cost(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._3059661cost;
            if (_local_2 !== _arg_1)
            {
                this._3059661cost = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cost", _local_2, _arg_1));
            };
        }

        public function set refreshNumFree(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._674573239refreshNumFree;
            if (_local_2 !== _arg_1)
            {
                this._674573239refreshNumFree = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "refreshNumFree", _local_2, _arg_1));
            };
        }

        public function onGetMazeData(_arg_1:Object):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            this["cost"].htmlText = Language.MAZE_PANEL_U[1].toString().replace("{num}", _arg_1.preData.cost);
            this["enterNumRemain"].text = Language.MAZE_PANEL_U[6].toString().replace("{num}", _arg_1.preData.enterNumRemain);
            this["refreshNumFree"].text = Language.MAZE_PANEL_U[6].toString().replace("{num}", _arg_1.preData.refreshNumFree);
            if (((_level == int(_arg_1.preData.level)) && (!(_level == _maxLevel))))
            {
                _core.sysMidNote(Language.MAZE_PANEL_U[28]);
            }
            else
            {
                _core.sysMidNote(Language.MAZE_PANEL_U[27]);
            };
            _level = int(_arg_1.preData.level);
            _freeRefreshNum = int(_arg_1.preData.refreshNumFree);
            _cost = int(_arg_1.preData.cost);
            switch (_level)
            {
                case 1:
                    this["currentLevelLabel"].htmlText = Language.MAZE_PANEL_U[20].toString().replace("{level}", Language.MAZE_PANEL_U[21]);
                    break;
                case 2:
                    this["currentLevelLabel"].htmlText = Language.MAZE_PANEL_U[20].toString().replace("{level}", Language.MAZE_PANEL_U[22]);
                    break;
                case 3:
                    this["currentLevelLabel"].htmlText = Language.MAZE_PANEL_U[20].toString().replace("{level}", Language.MAZE_PANEL_U[23]);
                    break;
                case 4:
                    this["currentLevelLabel"].htmlText = Language.MAZE_PANEL_U[20].toString().replace("{level}", Language.MAZE_PANEL_U[24]);
                    break;
                case 5:
                    this["currentLevelLabel"].htmlText = Language.MAZE_PANEL_U[20].toString().replace("{level}", Language.MAZE_PANEL_U[25]);
                    break;
            };
            if (_freeRefreshNum > 0)
            {
                this["cost"].visible = false;
            }
            else
            {
                this["cost"].visible = true;
            };
            if (_level >= 5)
            {
                this["cost"].visible = false;
            }
            else
            {
                this["cost"].visible = true;
            };
            var _local_2:* = 1;
            while (_local_2 <= 5)
            {
                this[("image" + _local_2)].source = img6;
                _local_2++;
            };
            if (int(_arg_1.preData.level) == 1)
            {
                this["image1"].source = img1;
            };
            if (int(_arg_1.preData.level) == 2)
            {
                this["image2"].source = img2;
            };
            if (int(_arg_1.preData.level) == 3)
            {
                this["image3"].source = img3;
            };
            if (int(_arg_1.preData.level) == 4)
            {
                this["image4"].source = img4;
            };
            if (int(_arg_1.preData.level) == 5)
            {
                this["image5"].source = img5;
            };
            if (int(_arg_1.preData.enterNumRemain) <= 0)
            {
                enterButton.enabled = false;
                refreshButton.enabled = false;
            }
            else
            {
                enterButton.enabled = true;
                refreshButton.enabled = true;
            };
        }

        [Bindable(event="propertyChange")]
        public function get enterNumRemain():RoundedLabel
        {
            return (this._1521838490enterNumRemain);
        }

        public function onEnterMaze(_arg_1:Object):void
        {
            if (!_arg_1)
            {
                return;
            };
            var _local_2:* = _core.view.getUI(ViewManager.PANEL_MAZE_INFO);
            if (_local_2)
            {
                _local_2.showPanel();
            };
        }

        public function enterClick():void
        {
            _core.remote.call("enterMaze", new Responder(onEnterMaze), null);
        }

        [Bindable(event="propertyChange")]
        public function get currentLevelLabel():RoundedLabel
        {
            return (this._1133599785currentLevelLabel);
        }

        public function set eventContent(_arg_1:IntroText):void
        {
            var _local_2:Object = this._1859786879eventContent;
            if (_local_2 !== _arg_1)
            {
                this._1859786879eventContent = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "eventContent", _local_2, _arg_1));
            };
        }

        private function _MazePanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_PANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MazePanel_BasicTitleCanvas1.text = _arg_1;
            }, "_MazePanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_PANEL_U[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                currentLevelLabel.htmlText = _arg_1;
            }, "currentLevelLabel.htmlText");
            result[1] = binding;
            binding = new Binding(this, function ():Object
            {
                return (img6);
            }, function (_arg_1:Object):void
            {
                image1.source = _arg_1;
            }, "image1.source");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_PANEL_U[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                image1.toolTip = _arg_1;
            }, "image1.toolTip");
            result[3] = binding;
            binding = new Binding(this, function ():Object
            {
                return (img6);
            }, function (_arg_1:Object):void
            {
                image2.source = _arg_1;
            }, "image2.source");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_PANEL_U[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                image2.toolTip = _arg_1;
            }, "image2.toolTip");
            result[5] = binding;
            binding = new Binding(this, function ():Object
            {
                return (img6);
            }, function (_arg_1:Object):void
            {
                image3.source = _arg_1;
            }, "image3.source");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_PANEL_U[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                image3.toolTip = _arg_1;
            }, "image3.toolTip");
            result[7] = binding;
            binding = new Binding(this, function ():Object
            {
                return (img6);
            }, function (_arg_1:Object):void
            {
                image4.source = _arg_1;
            }, "image4.source");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_PANEL_U[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                image4.toolTip = _arg_1;
            }, "image4.toolTip");
            result[9] = binding;
            binding = new Binding(this, function ():Object
            {
                return (img6);
            }, function (_arg_1:Object):void
            {
                image5.source = _arg_1;
            }, "image5.source");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_PANEL_U[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                image5.toolTip = _arg_1;
            }, "image5.toolTip");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_PANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                cost.htmlText = _arg_1;
            }, "cost.htmlText");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_PANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MazePanel_RoundedLabel3.text = _arg_1;
            }, "_MazePanel_RoundedLabel3.text");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_PANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                refreshNumFree.text = _arg_1;
            }, "refreshNumFree.text");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_PANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MazePanel_RoundedLabel5.text = _arg_1;
            }, "_MazePanel_RoundedLabel5.text");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_PANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                enterNumRemain.text = _arg_1;
            }, "enterNumRemain.text");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_PANEL_U[26];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                eventContent.htmlText = _arg_1;
            }, "eventContent.htmlText");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_PANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                enterButton.label = _arg_1;
            }, "enterButton.label");
            result[18] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_PANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                refreshButton.label = _arg_1;
            }, "refreshButton.label");
            result[19] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_PANEL_U[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MazePanel_RoundedLabel7.htmlText = _arg_1;
            }, "_MazePanel_RoundedLabel7.htmlText");
            result[20] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_PANEL_U[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MazePanel_RoundedLabel8.htmlText = _arg_1;
            }, "_MazePanel_RoundedLabel8.htmlText");
            result[21] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_PANEL_U[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MazePanel_RoundedLabel9.htmlText = _arg_1;
            }, "_MazePanel_RoundedLabel9.htmlText");
            result[22] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_PANEL_U[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MazePanel_RoundedLabel10.htmlText = _arg_1;
            }, "_MazePanel_RoundedLabel10.htmlText");
            result[23] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_PANEL_U[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MazePanel_RoundedLabel11.htmlText = _arg_1;
            }, "_MazePanel_RoundedLabel11.htmlText");
            result[24] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get enterButton():Button
        {
            return (this._428894166enterButton);
        }

        public function set enterNumRemain(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1521838490enterNumRemain;
            if (_local_2 !== _arg_1)
            {
                this._1521838490enterNumRemain = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "enterNumRemain", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get image1():Image
        {
            return (this._1185250762image1);
        }

        public function onGetMazePreData(_arg_1:Object):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            this["cost"].htmlText = Language.MAZE_PANEL_U[1].toString().replace("{num}", _arg_1.preData.cost);
            this["enterNumRemain"].text = Language.MAZE_PANEL_U[6].toString().replace("{num}", _arg_1.preData.enterNumRemain);
            this["refreshNumFree"].text = Language.MAZE_PANEL_U[6].toString().replace("{num}", _arg_1.preData.refreshNumFree);
            _level = int(_arg_1.preData.level);
            _freeRefreshNum = int(_arg_1.preData.refreshNumFree);
            _cost = int(_arg_1.preData.cost);
            switch (_level)
            {
                case 1:
                    this["currentLevelLabel"].htmlText = Language.MAZE_PANEL_U[20].toString().replace("{level}", Language.MAZE_PANEL_U[21]);
                    break;
                case 2:
                    this["currentLevelLabel"].htmlText = Language.MAZE_PANEL_U[20].toString().replace("{level}", Language.MAZE_PANEL_U[22]);
                    break;
                case 3:
                    this["currentLevelLabel"].htmlText = Language.MAZE_PANEL_U[20].toString().replace("{level}", Language.MAZE_PANEL_U[23]);
                    break;
                case 4:
                    this["currentLevelLabel"].htmlText = Language.MAZE_PANEL_U[20].toString().replace("{level}", Language.MAZE_PANEL_U[24]);
                    break;
                case 5:
                    this["currentLevelLabel"].htmlText = Language.MAZE_PANEL_U[20].toString().replace("{level}", Language.MAZE_PANEL_U[25]);
                    break;
            };
            if (_freeRefreshNum > 0)
            {
                this["cost"].visible = false;
            }
            else
            {
                this["cost"].visible = true;
            };
            if (_level >= 5)
            {
                this["cost"].visible = false;
            }
            else
            {
                this["cost"].visible = true;
            };
            var _local_2:* = 1;
            while (_local_2 <= 5)
            {
                this[("image" + _local_2)].source = img6;
                _local_2++;
            };
            if (int(_arg_1.preData.level) == 1)
            {
                this["image1"].source = img1;
            };
            if (int(_arg_1.preData.level) == 2)
            {
                this["image2"].source = img2;
            };
            if (int(_arg_1.preData.level) == 3)
            {
                this["image3"].source = img3;
            };
            if (int(_arg_1.preData.level) == 4)
            {
                this["image4"].source = img4;
            };
            if (int(_arg_1.preData.level) == 5)
            {
                this["image5"].source = img5;
            };
            if (int(_arg_1.preData.enterNumRemain) <= 0)
            {
                enterButton.enabled = false;
                refreshButton.enabled = false;
            }
            else
            {
                enterButton.enabled = true;
                refreshButton.enabled = true;
            };
        }

        [Bindable(event="propertyChange")]
        public function get image4():Image
        {
            return (this._1185250759image4);
        }

        [Bindable(event="propertyChange")]
        public function get image5():Image
        {
            return (this._1185250758image5);
        }

        [Bindable(event="propertyChange")]
        public function get eventContent():IntroText
        {
            return (this._1859786879eventContent);
        }

        [Bindable(event="propertyChange")]
        public function get image3():Image
        {
            return (this._1185250760image3);
        }

        [Bindable(event="propertyChange")]
        public function get image2():Image
        {
            return (this._1185250761image2);
        }

        private function _MazePanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.MAZE_PANEL_U[0];
            _local_1 = Language.MAZE_PANEL_U[20];
            _local_1 = img6;
            _local_1 = Language.MAZE_PANEL_U[15];
            _local_1 = img6;
            _local_1 = Language.MAZE_PANEL_U[16];
            _local_1 = img6;
            _local_1 = Language.MAZE_PANEL_U[17];
            _local_1 = img6;
            _local_1 = Language.MAZE_PANEL_U[18];
            _local_1 = img6;
            _local_1 = Language.MAZE_PANEL_U[19];
            _local_1 = Language.MAZE_PANEL_U[1];
            _local_1 = Language.MAZE_PANEL_U[2];
            _local_1 = Language.MAZE_PANEL_U[6];
            _local_1 = Language.MAZE_PANEL_U[3];
            _local_1 = Language.MAZE_PANEL_U[6];
            _local_1 = Language.MAZE_PANEL_U[26];
            _local_1 = Language.MAZE_PANEL_U[4];
            _local_1 = Language.MAZE_PANEL_U[5];
            _local_1 = Language.MAZE_PANEL_U[10];
            _local_1 = Language.MAZE_PANEL_U[11];
            _local_1 = Language.MAZE_PANEL_U[12];
            _local_1 = Language.MAZE_PANEL_U[13];
            _local_1 = Language.MAZE_PANEL_U[14];
        }

        public function __enterButton_click(_arg_1:MouseEvent):void
        {
            enterClick();
        }

        override public function initView():void
        {
        }

        public function set currentLevelLabel(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1133599785currentLevelLabel;
            if (_local_2 !== _arg_1)
            {
                this._1133599785currentLevelLabel = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "currentLevelLabel", _local_2, _arg_1));
            };
        }

        public function set enterButton(_arg_1:Button):void
        {
            var _local_2:Object = this._428894166enterButton;
            if (_local_2 !== _arg_1)
            {
                this._428894166enterButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "enterButton", _local_2, _arg_1));
            };
        }

        public function __refreshButton_click(_arg_1:MouseEvent):void
        {
            refreshClick();
        }

        [Bindable(event="propertyChange")]
        public function get refreshNumFree():RoundedLabel
        {
            return (this._674573239refreshNumFree);
        }

        public function set refreshButton(_arg_1:Button):void
        {
            var _local_2:Object = this._2033767917refreshButton;
            if (_local_2 !== _arg_1)
            {
                this._2033767917refreshButton = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "refreshButton", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get cost():RoundedLabel
        {
            return (this._3059661cost);
        }

        override public function set visible(_arg_1:Boolean):void
        {
            if (((_arg_1) && (_core.player.level < 120)))
            {
                Alert.show(Language.MAZE_PANEL_U[29]);
                return;
            };
            super.visible = _arg_1;
            if (_arg_1)
            {
                _core.remote.call("getMazePreDate", new Responder(onGetMazePreData), null);
            };
        }

        public function refreshClick():void
        {
            var func:Function;
            if (_level >= _maxLevel)
            {
                Alert.show(Language.MAZE_PANEL_U[7], "", Alert.OK);
                return;
            };
            if (_freeRefreshNum <= 0)
            {
                func = function (_arg_1:CloseEvent):void
                {
                    if (_arg_1.detail == Alert.YES)
                    {
                        _core.remote.call("refreshMaze", new Responder(onGetMazeData), null);
                    };
                };
                Alert.show(Language.MAZE_PANEL_U[9].toString().replace("{num}", _cost), "", (Alert.YES | Alert.NO), null, func);
            }
            else
            {
                _core.remote.call("refreshMaze", new Responder(onGetMazeData), null);
            };
        }

        public function set image2(_arg_1:Image):void
        {
            var _local_2:Object = this._1185250761image2;
            if (_local_2 !== _arg_1)
            {
                this._1185250761image2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "image2", _local_2, _arg_1));
            };
        }

        public function set image4(_arg_1:Image):void
        {
            var _local_2:Object = this._1185250759image4;
            if (_local_2 !== _arg_1)
            {
                this._1185250759image4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "image4", _local_2, _arg_1));
            };
        }

        public function set image1(_arg_1:Image):void
        {
            var _local_2:Object = this._1185250762image1;
            if (_local_2 !== _arg_1)
            {
                this._1185250762image1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "image1", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

