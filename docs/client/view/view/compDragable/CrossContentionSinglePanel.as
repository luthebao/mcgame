// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.CrossContentionSinglePanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.DataGrid;
    import mx.containers.Canvas;
    import mx.controls.Label;
    import mx.controls.Image;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.containers.ViewStack;
    import mx.controls.dataGridClasses.DataGridColumn;
    import mx.controls.Alert;
    import flash.utils.Timer;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.LinkButton;
    import mx.core.UIComponentDescriptor;
    import mx.containers.HBox;
    import com.qeedoo.game.system.Core;
    import mx.collections.ArrayCollection;
    import com.qeedoo.effects.EnterFrameMove;
    import mx.core.mx_internal;
    import mx.binding.BindingManager;
    import flash.events.MouseEvent;
    import mx.events.PropertyChangeEvent;
    import flash.events.TimerEvent;
    import com.qeedoo.ui.view.comp.CrossContentionIcon;
    import com.qeedoo.ui.resource.ResManager;
    import mx.events.ListEvent;
    import flash.utils.clearTimeout;
    import flash.utils.setTimeout;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.config.Language;
    import mx.managers.PopUpManager;
    import mx.core.ClassFactory;
    import com.qeedoo.game.view.ViewManager;
    import mx.binding.Binding;
    import flash.utils.getDefinitionByName;
    import mx.events.FlexEvent;
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

    public class CrossContentionSinglePanel extends DragableCanvas implements IBindingClient 
    {

        public static var MAP_ID:int;
        public static var bossData:Object = new Object();
        public static var mData:Object = new Object();
        public static const MOVE_DELAY:Number = 300;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _62409574ContentionSingleState:DataGrid;
        private var _3046233cav1:Canvas;
        private var timeOutId:uint = 0;
        public var moveStep:Number = 20;
        private var _1003879380ownLag:Label;
        private var bg:Image;
        private var downBtn:Image;
        private var _1554141559tabBtn0:BasicGlowButton;
        public var _CrossContentionSinglePanel_BasicGlowButton4:BasicGlowButton;
        private var _114581tab:ViewStack;
        public var _CrossContentionSinglePanel_DataGridColumn1:DataGridColumn;
        public var _CrossContentionSinglePanel_DataGridColumn2:DataGridColumn;
        public var _CrossContentionSinglePanel_DataGridColumn3:DataGridColumn;
        public var _CrossContentionSinglePanel_DataGridColumn4:DataGridColumn;
        public var _CrossContentionSinglePanel_DataGridColumn5:DataGridColumn;
        public var _CrossContentionSinglePanel_DataGridColumn6:DataGridColumn;
        private var _1554141557tabBtn2:BasicGlowButton;
        private var rightBtn:Image;
        private var _1003870966ownTxt:Label;
        private var btnCanvas:Canvas;
        private var leftBtn:Image;
        private var _910732927ContentionServerState:DataGrid;
        private var _1024147356anameTxt:Label;
        private var _2126222779bossInfo:Label;
        public var oldX:Number = 0;
        public var oldY:Number = 0;
        private var _helpAlert:Alert;
        private var _530004280mainContainer:Canvas;
        private var _1024155770anameLag:Label;
        private var _3046235cav3:Canvas;
        private var _68590309bossLag:Label;
        private var timer:Timer;
        private var _68598723bossTxt:Label;
        private var _1708013002ContentionMyState:DataGrid;
        private var _1554141558tabBtn1:BasicGlowButton;
        private var _1287834292panelTitle:BasicTitleCanvas;
        public var _CrossContentionSinglePanel_LinkButton1:LinkButton;
        private var btnBG:Image;
        private var _3046234cav2:Canvas;
        private var btnType:int = 0;
        private var upBtn:Image;
        private var container1:Canvas;
        public var downX:Number = 0;
        public var downY:Number = 0;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":955,
                    "height":600,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"panelTitle"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":39,
                                "percentWidth":100,
                                "percentHeight":100,
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"mainContainer",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "10";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":760,
                                            "height":535,
                                            "styleName":"RoundedGradientBorder",
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":HBox,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":770,
                                            "y":80,
                                            "styleName":"HTabWrapper",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"tabBtn0",
                                                "events":{"click":"__tabBtn0_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":55,
                                                        "styleName":"HorizontalTab",
                                                        "selected":true
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"tabBtn1",
                                                "events":{"click":"__tabBtn1_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":55,
                                                        "styleName":"HorizontalTab"
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":BasicGlowButton,
                                                "id":"tabBtn2",
                                                "events":{"click":"__tabBtn2_click"},
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "width":55,
                                                        "styleName":"HorizontalTab"
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"anameLag",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFF00;
                                        this.fontWeight = "bold";
                                        this.fontSize = 16;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":770,
                                            "y":0
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"anameTxt",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFF00;
                                        this.fontSize = 16;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":820,
                                            "y":0
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"ownLag",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFF;
                                        this.fontWeight = "bold";
                                        this.fontSize = 16;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":770,
                                            "y":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"ownTxt",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFF;
                                        this.fontSize = 16;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":820,
                                            "y":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"bossLag",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFF00;
                                        this.fontWeight = "bold";
                                        this.fontSize = 16;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":770,
                                            "y":40
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"bossTxt",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 16;
                                        this.color = 0xFF00;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":820,
                                            "y":40
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"_CrossContentionSinglePanel_BasicGlowButton4",
                                    "events":{"click":"___CrossContentionSinglePanel_BasicGlowButton4_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.right = "8";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":40,
                                            "styleName":"BtnStdRed"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"bossInfo",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                        this.fontSize = 13;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":770,
                                            "y":62
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":LinkButton,
                                    "id":"_CrossContentionSinglePanel_LinkButton1",
                                    "events":{"click":"___CrossContentionSinglePanel_LinkButton1_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.right = "10";
                                        this.bottom = "5";
                                        this.color = 0xFFE600;
                                        this.textDecoration = "underline";
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ViewStack,
                                    "id":"tab",
                                    "stylesFactory":function ():void
                                    {
                                        this.right = "10";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":100,
                                            "width":175,
                                            "height":435,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"cav1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "percentWidth":100,
                                                        "height":530,
                                                        "styleName":"RoundedGradientBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":DataGrid,
                                                            "id":"ContentionSingleState",
                                                            "events":{
                                                                "itemClick":"__ContentionSingleState_itemClick",
                                                                "rollOut":"__ContentionSingleState_rollOut",
                                                                "itemRollOver":"__ContentionSingleState_itemRollOver"
                                                            },
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.bottom = "10";
                                                                this.left = "10";
                                                                this.right = "10";
                                                                this.top = "10";
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "resizableColumns":false,
                                                                    "draggableColumns":false,
                                                                    "sortableColumns":false,
                                                                    "columns":[_CrossContentionSinglePanel_DataGridColumn1_i(), _CrossContentionSinglePanel_DataGridColumn2_i()]
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"cav2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "percentWidth":100,
                                                        "height":530,
                                                        "styleName":"RoundedGradientBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":DataGrid,
                                                            "id":"ContentionServerState",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.bottom = "50";
                                                                this.left = "5";
                                                                this.right = "5";
                                                                this.top = "10";
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "resizableColumns":false,
                                                                    "draggableColumns":false,
                                                                    "sortableColumns":false,
                                                                    "columns":[_CrossContentionSinglePanel_DataGridColumn3_i(), _CrossContentionSinglePanel_DataGridColumn4_i()]
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"cav3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "percentWidth":100,
                                                        "height":530,
                                                        "styleName":"RoundedGradientBorder",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":DataGrid,
                                                            "id":"ContentionMyState",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.bottom = "50";
                                                                this.left = "5";
                                                                this.right = "5";
                                                                this.top = "10";
                                                                this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "resizableColumns":false,
                                                                    "draggableColumns":false,
                                                                    "sortableColumns":false,
                                                                    "columns":[_CrossContentionSinglePanel_DataGridColumn5_i(), _CrossContentionSinglePanel_DataGridColumn6_i()]
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
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var _1811209095totaStateList:ArrayCollection = new ArrayCollection();
        private var _1025628825singleStateList:ArrayCollection = new ArrayCollection();
        private var serverData:ArrayCollection = new ArrayCollection();
        private var myData:ArrayCollection = new ArrayCollection();
        private var bossIcons:Array = [];
        private var icons:Array = [];
        private var moveE:EnterFrameMove = new EnterFrameMove();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function CrossContentionSinglePanel()
        {
            mx_internal::_document = this;
            this.width = 955;
            this.height = 600;
            this.styleName = "StandardContent";
            this.addEventListener("creationComplete", ___CrossContentionSinglePanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            CrossContentionSinglePanel._watcherSetupUtil = _arg_1;
        }


        private function _CrossContentionSinglePanel_DataGridColumn3_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _CrossContentionSinglePanel_DataGridColumn3 = _local_1;
            _local_1.width = 30;
            _local_1.dataField = "aname";
            BindingManager.executeBindings(this, "_CrossContentionSinglePanel_DataGridColumn3", _CrossContentionSinglePanel_DataGridColumn3);
            return (_local_1);
        }

        private function mouseMove(_arg_1:MouseEvent):void
        {
            container1.x = ((_arg_1.stageX - downX) + oldX);
            container1.y = ((_arg_1.stageY - downY) + oldY);
            if ((container1.x + bg.width) < mainContainer.width)
            {
                container1.x = (mainContainer.width - bg.width);
            };
            if (container1.x > 0)
            {
                container1.x = 0;
            };
            if ((container1.y + bg.height) < mainContainer.height)
            {
                container1.y = (mainContainer.height - bg.height);
            };
            if (container1.y > 0)
            {
                container1.y = 0;
            };
        }

        public function set ownTxt(_arg_1:Label):void
        {
            var _local_2:Object = this._1003870966ownTxt;
            if (_local_2 !== _arg_1)
            {
                this._1003870966ownTxt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ownTxt", _local_2, _arg_1));
            };
        }

        private function mouseUp(_arg_1:MouseEvent):void
        {
            if (container1.hasEventListener(MouseEvent.MOUSE_UP))
            {
                container1.removeEventListener(MouseEvent.MOUSE_UP, mouseUp);
                container1.removeEventListener(MouseEvent.MOUSE_MOVE, mouseMove);
            };
        }

        private function btnMouseUp(_arg_1:MouseEvent):void
        {
            btnType = 0;
            if (this.stage.hasEventListener(MouseEvent.MOUSE_UP))
            {
                this.stage.removeEventListener(MouseEvent.MOUSE_UP, btnMouseUp);
            };
            if (((timer) && (timer.running)))
            {
                timer.stop();
            };
        }

        [Bindable(event="propertyChange")]
        public function get ownLag():Label
        {
            return (this._1003879380ownLag);
        }

        [Bindable(event="propertyChange")]
        public function get ContentionMyState():DataGrid
        {
            return (this._1708013002ContentionMyState);
        }

        private function inMembers(_arg_1:Object):Boolean
        {
            if (((!(_arg_1)) || (!(_arg_1.head))))
            {
                return (false);
            };
            var _local_2:Object = _arg_1.head;
            while (_local_2)
            {
                if (((_local_2.obj) && (Number(_local_2.obj) == _core.player.id)))
                {
                    return (true);
                };
                _local_2 = _local_2.next;
            };
            return (false);
        }

        private function _CrossContentionSinglePanel_DataGridColumn2_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _CrossContentionSinglePanel_DataGridColumn2 = _local_1;
            _local_1.width = 30;
            _local_1.dataField = "osid";
            _local_1.itemRenderer = _CrossContentionSinglePanel_ClassFactory2_c();
            BindingManager.executeBindings(this, "_CrossContentionSinglePanel_DataGridColumn2", _CrossContentionSinglePanel_DataGridColumn2);
            return (_local_1);
        }

        private function timerHandler(_arg_1:TimerEvent):void
        {
            if (btnType == 1)
            {
                toLeft();
            }
            else
            {
                if (btnType == 2)
                {
                    toUp();
                }
                else
                {
                    if (btnType == 3)
                    {
                        toRight();
                    }
                    else
                    {
                        if (btnType == 4)
                        {
                            toDown();
                        }
                        else
                        {
                            btnType = 0;
                            timer.stop();
                        };
                    };
                };
            };
        }

        public function set ownLag(_arg_1:Label):void
        {
            var _local_2:Object = this._1003879380ownLag;
            if (_local_2 !== _arg_1)
            {
                this._1003879380ownLag = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ownLag", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get anameTxt():Label
        {
            return (this._1024147356anameTxt);
        }

        public function set ContentionMyState(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._1708013002ContentionMyState;
            if (_local_2 !== _arg_1)
            {
                this._1708013002ContentionMyState = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ContentionMyState", _local_2, _arg_1));
            };
        }

        private function toRight(_arg_1:MouseEvent=null):void
        {
            container1.x = (container1.x + moveStep);
            if (container1.x > 0)
            {
                container1.x = 0;
            };
            if (_arg_1)
            {
                btnType = 3;
                btnAutoMove();
            };
        }

        public function __tabBtn0_click(_arg_1:MouseEvent):void
        {
            btnClick(0);
        }

        private function toUp(_arg_1:MouseEvent=null):void
        {
            container1.y = (container1.y - moveStep);
            if ((container1.y + bg.height) < mainContainer.height)
            {
                container1.y = (mainContainer.height - bg.height);
            };
            if (_arg_1)
            {
                btnType = 2;
                btnAutoMove();
            };
        }

        [Bindable(event="propertyChange")]
        public function get ContentionServerState():DataGrid
        {
            return (this._910732927ContentionServerState);
        }

        private function _CrossContentionSinglePanel_DataGridColumn1_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _CrossContentionSinglePanel_DataGridColumn1 = _local_1;
            _local_1.width = 50;
            _local_1.dataField = "aname";
            _local_1.itemRenderer = _CrossContentionSinglePanel_ClassFactory1_c();
            BindingManager.executeBindings(this, "_CrossContentionSinglePanel_DataGridColumn1", _CrossContentionSinglePanel_DataGridColumn1);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn0():BasicGlowButton
        {
            return (this._1554141559tabBtn0);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn2():BasicGlowButton
        {
            return (this._1554141557tabBtn2);
        }

        private function mapInit():void
        {
            var _local_2:CrossContentionIcon;
            if (container1)
            {
                return;
            };
            container1 = new Canvas();
            container1.addEventListener(MouseEvent.MOUSE_DOWN, mapClick);
            mainContainer.addChild(container1);
            bg = new Image();
            container1.addChild(bg);
            btnCanvas = new Canvas();
            btnBG = new Image();
            btnBG.addEventListener(MouseEvent.MOUSE_DOWN, iconClick);
            btnBG.source = ResManager.getIconUrl(4130220000324);
            btnCanvas.x = (mainContainer.width - 230);
            btnCanvas.y = 10;
            leftBtn = new Image();
            leftBtn.buttonMode = true;
            leftBtn.x = 2;
            leftBtn.y = 26;
            leftBtn.source = ResManager.getIconUrl(4130220000328);
            rightBtn = new Image();
            rightBtn.buttonMode = true;
            rightBtn.x = 46;
            rightBtn.y = 26;
            rightBtn.source = ResManager.getIconUrl(4130220000327);
            upBtn = new Image();
            upBtn.buttonMode = true;
            upBtn.x = 26;
            upBtn.y = 2;
            upBtn.source = ResManager.getIconUrl(4130220000325);
            downBtn = new Image();
            downBtn.buttonMode = true;
            downBtn.x = 26;
            downBtn.y = 44;
            downBtn.source = ResManager.getIconUrl(4130220000326);
            btnCanvas.addChild(btnBG);
            btnCanvas.addChild(leftBtn);
            btnCanvas.addChild(rightBtn);
            btnCanvas.addChild(upBtn);
            btnCanvas.addChild(downBtn);
            mainContainer.addChild(btnCanvas);
            leftBtn.addEventListener(MouseEvent.MOUSE_DOWN, toRight);
            leftBtn.styleName = "CrystalBlueButton";
            rightBtn.addEventListener(MouseEvent.MOUSE_DOWN, toLeft);
            rightBtn.styleName = "CrystalBlueButton";
            upBtn.addEventListener(MouseEvent.MOUSE_DOWN, toDown);
            upBtn.styleName = "CrystalBlueButton";
            downBtn.addEventListener(MouseEvent.MOUSE_DOWN, toUp);
            downBtn.styleName = "CrystalBlueButton";
            var _local_1:int = 1;
            while (_local_1 < 101)
            {
                _local_2 = new CrossContentionIcon();
                _local_2.x = (15 + (130 * int(((_local_1 - 1) % 10))));
                _local_2.y = (15 + (130 * int(((_local_1 - 1) / 10))));
                _local_2.index = _local_1;
                icons[_local_1] = _local_2;
                _local_2.buttonMode = true;
                container1.addChild(_local_2);
                _local_1++;
            };
        }

        private function iconClick(_arg_1:MouseEvent):void
        {
            if (((!(_arg_1.target.x == 0)) || (!(_arg_1.target.y == 0))))
            {
                return;
            };
            downX = _arg_1.stageX;
            downY = _arg_1.stageY;
            oldX = btnCanvas.x;
            oldY = btnCanvas.y;
            mainContainer.addEventListener(MouseEvent.MOUSE_UP, iconMouseUp);
            mainContainer.addEventListener(MouseEvent.MOUSE_MOVE, iconMouseMove);
        }

        public function __ContentionSingleState_itemRollOver(_arg_1:ListEvent):void
        {
            onItemRollOver(_arg_1);
        }

        private function btnClick(_arg_1:int):void
        {
            tab.selectedIndex = _arg_1;
            var _local_2:int;
            while (_local_2 <= (tab.numChildren - 1))
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

        [Bindable(event="propertyChange")]
        public function get ContentionSingleState():DataGrid
        {
            return (this._62409574ContentionSingleState);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn1():BasicGlowButton
        {
            return (this._1554141558tabBtn1);
        }

        private function btnAutoMove():void
        {
            if (!timer)
            {
                timer = new Timer(MOVE_DELAY);
                timer.addEventListener(TimerEvent.TIMER, timerHandler);
            };
            this.stage.addEventListener(MouseEvent.MOUSE_UP, btnMouseUp);
            timer.start();
        }

        private function onItemRollOver(_arg_1:ListEvent):void
        {
            var _local_4:CrossContentionIcon;
            var _local_2:int = _arg_1.itemRenderer.data.id;
            var _local_3:int = 1;
            while (_local_3 <= 100)
            {
                _local_4 = icons[_local_3];
                if (_local_4.index == _local_2)
                {
                    _local_4.beSelected();
                    if (timeOutId != 0)
                    {
                        clearTimeout(timeOutId);
                    };
                    timeOutId = setTimeout(mapAutoMove, MOVE_DELAY, _local_4);
                }
                else
                {
                    _local_4.beUnSelected();
                };
                _local_3++;
            };
        }

        public function onGetCrossContentionSingleState(_arg_1:Object):void
        {
            var _local_2:String;
            var _local_5:Object;
            var _local_6:Array;
            var _local_7:Object;
            var _local_9:Object;
            var _local_10:Object;
            var _local_11:Number;
            var _local_12:int;
            var _local_13:Object;
            mainContainer.visible = false;
            this.visible = true;
            MAP_ID = _arg_1.mid;
            if (_arg_1.lvlType)
            {
                CrossContentionTotalPanel.LEVLE_TYPE = _arg_1.lvlType;
            };
            singleStateList.removeAll();
            mData = _arg_1;
            bossData = _arg_1.boss;
            anameTxt.text = GamePredef.CROSS_CONTENTION_MAP[MAP_ID].name;
            if (((_arg_1) && (_arg_1.osid)))
            {
                _local_2 = CrossContentionTotalPanel.getServerName(Number(_arg_1.osid));
                ownTxt.text = Language.CROSS_CONTENTION_PANEL_U[35].toString().replace("{osid}", _local_2);
                ownTxt.toolTip = CrossContentionTotalPanel.getUnitServersName(Number(_arg_1.osid));
            }
            else
            {
                ownTxt.toolTip = "";
                ownTxt.text = Language.CROSS_CONTENTION_PANEL_U[34];
            };
            if ((((((((_arg_1) && (_arg_1.boss)) && (!(_arg_1.boss.bIndex == null))) && (_arg_1.boss.data)) && (_arg_1.boss.data[_arg_1.boss.bIndex])) && (int(_arg_1.boss.data[_arg_1.boss.bIndex].state) == 2)) && (_arg_1.boss.data[_arg_1.boss.bIndex].osid)))
            {
                _local_2 = CrossContentionTotalPanel.getServerName(Number(_arg_1.boss.data[_arg_1.boss.bIndex].osid));
                bossTxt.htmlText = Language.CROSS_CONTENTION_PANEL_U[81].toString().replace("{osid}", _local_2);
            }
            else
            {
                bossTxt.text = Language.CROSS_CONTENTION_PANEL_U[22];
            };
            var _local_3:int = 1;
            while (_local_3 <= 100)
            {
                _local_9 = {};
                _local_9.p = GamePredef.CROSS_CONTENTION_REC_TEMP_DATA[GamePredef.CROSS_CONTENTION_MAP_REC_INIT[MAP_ID]][_local_3].p;
                _local_9.id = _local_3;
                _local_9.aname = ((Language.CROSS_CONTENTION_PANEL_U[(67 + _local_9.p)] + "-") + _local_3);
                if (((((_arg_1) && (_arg_1["mData"])) && (_arg_1["mData"][_local_3])) && (_arg_1["mData"][_local_3].osid)))
                {
                    _local_2 = CrossContentionTotalPanel.getServerName(Number(_arg_1["mData"][_local_3].osid));
                    _local_9.osid = Language.CROSS_CONTENTION_PANEL_U[16].toString().replace("{osid}", _local_2);
                }
                else
                {
                    _local_9.osid = Language.CROSS_CONTENTION_PANEL_U[34];
                };
                singleStateList.addItem(_local_9);
                _local_3++;
            };
            serverData.removeAll();
            var _local_4:Object = {};
            if (((_arg_1) && (_arg_1["mData"])))
            {
                for (_local_10 in _arg_1["mData"])
                {
                    if (((Number(_local_10) > 0) && (_arg_1["mData"][_local_10].osid)))
                    {
                        _local_11 = _arg_1["mData"][_local_10].osid;
                        if (!_local_4[_local_11])
                        {
                            _local_4[_local_11] = {"num":0};
                        };
                        _local_4[_local_11].num++;
                    };
                };
            };
            for (_local_5 in _local_4)
            {
                _local_2 = CrossContentionTotalPanel.getServerName(Number(_local_5));
                serverData.addItem({
                    "aname":Language.CROSS_CONTENTION_PANEL_U[35].toString().replace("{osid}", _local_2),
                    "num":_local_4[_local_5].num
                });
            };
            myData.removeAll();
            _local_6 = [{
                "pname":Language.CROSS_CONTENTION_PANEL_U[68],
                "num":0
            }, {
                "pname":Language.CROSS_CONTENTION_PANEL_U[69],
                "num":0
            }, {
                "pname":Language.CROSS_CONTENTION_PANEL_U[70],
                "num":0
            }, {
                "pname":Language.CROSS_CONTENTION_PANEL_U[71],
                "num":0
            }, {
                "pname":Language.CROSS_CONTENTION_PANEL_U[72],
                "num":0
            }];
            _local_7 = GamePredef.CROSS_CONTENTION_REC_TEMP_DATA[GamePredef.CROSS_CONTENTION_MAP_REC_INIT[_arg_1.mid]];
            if (((_arg_1) && (_arg_1["mData"])))
            {
                for (_local_10 in _arg_1["mData"])
                {
                    if ((((Number(_local_10) > 0) && (_arg_1["mData"][_local_10].osid == CrossContentionTotalPanel._ORIGINAL_SERVER_ID)) && (inMembers(_arg_1["mData"][_local_10].members))))
                    {
                        _local_11 = _arg_1["mData"][_local_10].osid;
                        _local_12 = _local_7[_local_10].p;
                        _local_6[(_local_12 - 1)].num++;
                    };
                };
            };
            var _local_8:int;
            while (_local_8 < _local_6.length)
            {
                _local_13 = _local_6[_local_8];
                myData.addItem({
                    "p":_local_8,
                    "pname":_local_13.pname,
                    "num":_local_13.num
                });
                _local_8++;
            };
            mapRefresh();
            mainContainer.visible = true;
        }

        public function set cav1(_arg_1:Canvas):void
        {
            var _local_2:Object = this._3046233cav1;
            if (_local_2 !== _arg_1)
            {
                this._3046233cav1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cav1", _local_2, _arg_1));
            };
        }

        public function onOpenAreaPanel(_arg_1:Object):void
        {
            var _local_2:CrossContentionIcon = icons[_arg_1];
            if (_local_2)
            {
                _local_2.showAlert(false);
            };
        }

        public function set cav3(_arg_1:Canvas):void
        {
            var _local_2:Object = this._3046235cav3;
            if (_local_2 !== _arg_1)
            {
                this._3046235cav3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cav3", _local_2, _arg_1));
            };
        }

        private function howToPlay():void
        {
            if (_helpAlert)
            {
                PopUpManager.removePopUp(_helpAlert);
                _helpAlert = null;
            };
            var _local_1:String = Language.CROSS_CONTENTION_PANEL_U[131].toString();
            _helpAlert = Alert.show(_local_1, Language.CROSS_CONTENTION_PANEL_U[131].toString(), Alert.YES, null, null);
        }

        public function ___CrossContentionSinglePanel_LinkButton1_click(_arg_1:MouseEvent):void
        {
            howToPlay();
        }

        public function set cav2(_arg_1:Canvas):void
        {
            var _local_2:Object = this._3046234cav2;
            if (_local_2 !== _arg_1)
            {
                this._3046234cav2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cav2", _local_2, _arg_1));
            };
        }

        private function findBoss():void
        {
            var _local_1:CrossContentionIcon = bossIcons[0];
            if (_local_1)
            {
                mapAutoMove(_local_1);
            };
        }

        public function set anameTxt(_arg_1:Label):void
        {
            var _local_2:Object = this._1024147356anameTxt;
            if (_local_2 !== _arg_1)
            {
                this._1024147356anameTxt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "anameTxt", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get panelTitle():BasicTitleCanvas
        {
            return (this._1287834292panelTitle);
        }

        private function set singleStateList(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._1025628825singleStateList;
            if (_local_2 !== _arg_1)
            {
                this._1025628825singleStateList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "singleStateList", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get mainContainer():Canvas
        {
            return (this._530004280mainContainer);
        }

        private function _CrossContentionSinglePanel_ClassFactory3_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = CrossContentionSinglePanel_inlineComponent3;
            _local_1.properties = {"outerDocument":this};
            return (_local_1);
        }

        override public function set visible(_arg_1:Boolean):void
        {
            var _local_2:Object;
            super.visible = _arg_1;
            if ((((_arg_1) && (_core.player)) && (_core.player.level < 50)))
            {
                return;
            };
            if (_arg_1)
            {
                initView();
                _local_2 = _core.view.getUI(ViewManager.PANEL_CROSS_CONTENTION_SINGLE_INFO);
                if (((_local_2) && (_local_2.visible)))
                {
                    _local_2.visible = false;
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get bossLag():Label
        {
            return (this._68590309bossLag);
        }

        public function __ContentionSingleState_itemClick(_arg_1:ListEvent):void
        {
            onItemClick(_arg_1);
        }

        public function __tabBtn2_click(_arg_1:MouseEvent):void
        {
            btnClick(2);
        }

        public function set ContentionServerState(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._910732927ContentionServerState;
            if (_local_2 !== _arg_1)
            {
                this._910732927ContentionServerState = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ContentionServerState", _local_2, _arg_1));
            };
        }

        public function showPanel(_arg_1:int):void
        {
            _core.remote.call("getCrossContentionSingleState", null, _arg_1);
        }

        public function __ContentionSingleState_rollOut(_arg_1:MouseEvent):void
        {
            onItemRollOut(_arg_1);
        }

        private function set totaStateList(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._1811209095totaStateList;
            if (_local_2 !== _arg_1)
            {
                this._1811209095totaStateList = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "totaStateList", _local_2, _arg_1));
            };
        }

        private function init():void
        {
        }

        public function set anameLag(_arg_1:Label):void
        {
            var _local_2:Object = this._1024155770anameLag;
            if (_local_2 !== _arg_1)
            {
                this._1024155770anameLag = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "anameLag", _local_2, _arg_1));
            };
        }

        public function set tabBtn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141558tabBtn1;
            if (_local_2 !== _arg_1)
            {
                this._1554141558tabBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn1", _local_2, _arg_1));
            };
        }

        private function onItemClick(_arg_1:ListEvent):void
        {
            var _local_4:CrossContentionIcon;
            var _local_5:Number;
            var _local_2:int = _arg_1.itemRenderer.data.id;
            var _local_3:* = _core.view.getUI(ViewManager.PANEL_CROSS_CONTENTION_AREA);
            if (_local_3)
            {
                _local_3.areaId = _local_2;
                _local_3.mapId = MAP_ID;
                _local_3.mapData = mData;
                _local_3.isBoss = false;
                _local_4 = icons[_local_2];
                _local_5 = 0;
                if (_local_4)
                {
                    _local_5 = _local_4.iconUrl;
                };
                _local_3.showPanel(mData, _local_5);
                _core.remote.call("crossContentionOpenPointPanel", null, _local_2);
            };
        }

        private function _CrossContentionSinglePanel_ClassFactory2_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = CrossContentionSinglePanel_inlineComponent2;
            _local_1.properties = {"outerDocument":this};
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get ownTxt():Label
        {
            return (this._1003870966ownTxt);
        }

        public function set tabBtn2(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141557tabBtn2;
            if (_local_2 !== _arg_1)
            {
                this._1554141557tabBtn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn2", _local_2, _arg_1));
            };
        }

        private function toLeft(_arg_1:MouseEvent=null):void
        {
            container1.x = (container1.x - moveStep);
            if ((container1.x + bg.width) < mainContainer.width)
            {
                container1.x = (mainContainer.width - bg.width);
            };
            if (_arg_1)
            {
                btnType = 1;
                btnAutoMove();
            };
        }

        private function _CrossContentionSinglePanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                panelTitle.text = _arg_1;
            }, "panelTitle.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn0.label = _arg_1;
            }, "tabBtn0.label");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[89];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn1.label = _arg_1;
            }, "tabBtn1.label");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn2.label = _arg_1;
            }, "tabBtn2.label");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[77];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                anameLag.text = _arg_1;
            }, "anameLag.text");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[78];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                ownLag.text = _arg_1;
            }, "ownLag.text");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[79];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bossLag.text = _arg_1;
            }, "bossLag.text");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[157];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionSinglePanel_BasicGlowButton4.label = _arg_1;
            }, "_CrossContentionSinglePanel_BasicGlowButton4.label");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[80];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bossInfo.text = _arg_1;
            }, "bossInfo.text");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[27];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionSinglePanel_LinkButton1.label = _arg_1;
            }, "_CrossContentionSinglePanel_LinkButton1.label");
            result[9] = binding;
            binding = new Binding(this, function ():Object
            {
                return (singleStateList);
            }, function (_arg_1:Object):void
            {
                ContentionSingleState.dataProvider = _arg_1;
            }, "ContentionSingleState.dataProvider");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionSinglePanel_DataGridColumn1.headerText = _arg_1;
            }, "_CrossContentionSinglePanel_DataGridColumn1.headerText");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionSinglePanel_DataGridColumn2.headerText = _arg_1;
            }, "_CrossContentionSinglePanel_DataGridColumn2.headerText");
            result[12] = binding;
            binding = new Binding(this, function ():Object
            {
                return (serverData);
            }, function (_arg_1:Object):void
            {
                ContentionServerState.dataProvider = _arg_1;
            }, "ContentionServerState.dataProvider");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionSinglePanel_DataGridColumn3.headerText = _arg_1;
            }, "_CrossContentionSinglePanel_DataGridColumn3.headerText");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[75];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionSinglePanel_DataGridColumn4.headerText = _arg_1;
            }, "_CrossContentionSinglePanel_DataGridColumn4.headerText");
            result[15] = binding;
            binding = new Binding(this, function ():Object
            {
                return (myData);
            }, function (_arg_1:Object):void
            {
                ContentionMyState.dataProvider = _arg_1;
            }, "ContentionMyState.dataProvider");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[76];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionSinglePanel_DataGridColumn5.headerText = _arg_1;
            }, "_CrossContentionSinglePanel_DataGridColumn5.headerText");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[67];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionSinglePanel_DataGridColumn6.headerText = _arg_1;
            }, "_CrossContentionSinglePanel_DataGridColumn6.headerText");
            result[18] = binding;
            return (result);
        }

        public function set tab(_arg_1:ViewStack):void
        {
            var _local_2:Object = this._114581tab;
            if (_local_2 !== _arg_1)
            {
                this._114581tab = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tab", _local_2, _arg_1));
            };
        }

        public function set tabBtn0(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141559tabBtn0;
            if (_local_2 !== _arg_1)
            {
                this._1554141559tabBtn0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn0", _local_2, _arg_1));
            };
        }

        public function ___CrossContentionSinglePanel_BasicGlowButton4_click(_arg_1:MouseEvent):void
        {
            findBoss();
        }

        public function set ContentionSingleState(_arg_1:DataGrid):void
        {
            var _local_2:Object = this._62409574ContentionSingleState;
            if (_local_2 !== _arg_1)
            {
                this._62409574ContentionSingleState = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ContentionSingleState", _local_2, _arg_1));
            };
        }

        private function _CrossContentionSinglePanel_ClassFactory1_c():ClassFactory
        {
            var _local_1:ClassFactory = new ClassFactory();
            _local_1.generator = CrossContentionSinglePanel_inlineComponent1;
            _local_1.properties = {"outerDocument":this};
            return (_local_1);
        }

        private function _CrossContentionSinglePanel_DataGridColumn6_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _CrossContentionSinglePanel_DataGridColumn6 = _local_1;
            _local_1.width = 30;
            _local_1.dataField = "num";
            BindingManager.executeBindings(this, "_CrossContentionSinglePanel_DataGridColumn6", _CrossContentionSinglePanel_DataGridColumn6);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get cav1():Canvas
        {
            return (this._3046233cav1);
        }

        [Bindable(event="propertyChange")]
        public function get cav3():Canvas
        {
            return (this._3046235cav3);
        }

        [Bindable(event="propertyChange")]
        public function get cav2():Canvas
        {
            return (this._3046234cav2);
        }

        private function iconMouseUp(_arg_1:MouseEvent):void
        {
            if (mainContainer.hasEventListener(MouseEvent.MOUSE_UP))
            {
                mainContainer.removeEventListener(MouseEvent.MOUSE_UP, iconMouseUp);
                mainContainer.removeEventListener(MouseEvent.MOUSE_MOVE, iconMouseMove);
            };
        }

        public function set panelTitle(_arg_1:BasicTitleCanvas):void
        {
            var _local_2:Object = this._1287834292panelTitle;
            if (_local_2 !== _arg_1)
            {
                this._1287834292panelTitle = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "panelTitle", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        private function get singleStateList():ArrayCollection
        {
            return (this._1025628825singleStateList);
        }

        private function _CrossContentionSinglePanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[0];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[1];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[89];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[3];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[77];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[78];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[79];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[157];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[80];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[27];
            _local_1 = singleStateList;
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[10];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[11];
            _local_1 = serverData;
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[11];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[75];
            _local_1 = myData;
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[76];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[67];
        }

        public function set bossInfo(_arg_1:Label):void
        {
            var _local_2:Object = this._2126222779bossInfo;
            if (_local_2 !== _arg_1)
            {
                this._2126222779bossInfo = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bossInfo", _local_2, _arg_1));
            };
        }

        private function _CrossContentionSinglePanel_DataGridColumn5_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _CrossContentionSinglePanel_DataGridColumn5 = _local_1;
            _local_1.width = 30;
            _local_1.dataField = "pname";
            _local_1.itemRenderer = _CrossContentionSinglePanel_ClassFactory3_c();
            BindingManager.executeBindings(this, "_CrossContentionSinglePanel_DataGridColumn5", _CrossContentionSinglePanel_DataGridColumn5);
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        private function get totaStateList():ArrayCollection
        {
            return (this._1811209095totaStateList);
        }

        private function mapClick(_arg_1:MouseEvent):void
        {
            downX = _arg_1.stageX;
            downY = _arg_1.stageY;
            oldX = container1.x;
            oldY = container1.y;
            container1.addEventListener(MouseEvent.MOUSE_UP, mouseUp);
            container1.addEventListener(MouseEvent.MOUSE_MOVE, mouseMove);
        }

        override public function initialize():void
        {
            var target:CrossContentionSinglePanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _CrossContentionSinglePanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_CrossContentionSinglePanelWatcherSetupUtil");
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
        public function get anameLag():Label
        {
            return (this._1024155770anameLag);
        }

        private function mapAutoMove(_arg_1:CrossContentionIcon):void
        {
            if (!_arg_1)
            {
                return;
            };
            if (moveE.active)
            {
                moveE.destroy();
            };
            var _local_2:Number = (((mainContainer.width / 2) - _arg_1.x) - container1.x);
            var _local_3:Number = (((mainContainer.height / 2) - _arg_1.y) - container1.y);
            var _local_4:Number = (container1.x + _local_2);
            var _local_5:Number = (container1.y + _local_3);
            if (_local_4 > 0)
            {
                _local_2 = -(container1.x);
            }
            else
            {
                if ((_local_4 + bg.width) < mainContainer.width)
                {
                    _local_2 = ((mainContainer.width - bg.width) - container1.x);
                };
            };
            if (_local_5 > 0)
            {
                _local_3 = -(container1.y);
            }
            else
            {
                if ((_local_5 + bg.height) < mainContainer.height)
                {
                    _local_3 = ((mainContainer.height - bg.height) - container1.y);
                };
            };
            moveE.target = container1;
            moveE.stepLength = (moveStep * 2);
            moveE.xBy = _local_2;
            moveE.yBy = _local_3;
            moveE.play(true);
        }

        private function iconMouseMove(_arg_1:MouseEvent):void
        {
            btnCanvas.x = ((_arg_1.stageX - downX) + oldX);
            btnCanvas.y = ((_arg_1.stageY - downY) + oldY);
            if ((btnCanvas.x + btnCanvas.width) > mainContainer.width)
            {
                btnCanvas.x = (mainContainer.width - btnCanvas.width);
            };
            if (btnCanvas.x < 0)
            {
                btnCanvas.x = 0;
            };
            if ((btnCanvas.y + btnCanvas.height) > mainContainer.height)
            {
                btnCanvas.y = (mainContainer.height - btnCanvas.height);
            };
            if (btnCanvas.y < 0)
            {
                btnCanvas.y = 0;
            };
        }

        public function set bossTxt(_arg_1:Label):void
        {
            var _local_2:Object = this._68598723bossTxt;
            if (_local_2 !== _arg_1)
            {
                this._68598723bossTxt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bossTxt", _local_2, _arg_1));
            };
        }

        private function onItemRollOut(_arg_1:MouseEvent):void
        {
            var _local_3:CrossContentionIcon;
            var _local_2:int = 1;
            while (_local_2 <= 100)
            {
                _local_3 = icons[_local_2];
                _local_3.beUnSelected();
                _local_2++;
            };
            if (moveE.active)
            {
                moveE.destroy();
            };
            if (timeOutId != 0)
            {
                clearTimeout(timeOutId);
                timeOutId = 0;
            };
        }

        [Bindable(event="propertyChange")]
        public function get tab():ViewStack
        {
            return (this._114581tab);
        }

        public function set mainContainer(_arg_1:Canvas):void
        {
            var _local_2:Object = this._530004280mainContainer;
            if (_local_2 !== _arg_1)
            {
                this._530004280mainContainer = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mainContainer", _local_2, _arg_1));
            };
        }

        public function __tabBtn1_click(_arg_1:MouseEvent):void
        {
            btnClick(1);
        }

        [Bindable(event="propertyChange")]
        public function get bossInfo():Label
        {
            return (this._2126222779bossInfo);
        }

        private function toDown(_arg_1:MouseEvent=null):void
        {
            container1.y = (container1.y + moveStep);
            if (container1.y > 0)
            {
                container1.y = 0;
            };
            if (_arg_1)
            {
                btnType = 4;
                btnAutoMove();
            };
        }

        [Bindable(event="propertyChange")]
        public function get bossTxt():Label
        {
            return (this._68598723bossTxt);
        }

        private function _CrossContentionSinglePanel_DataGridColumn4_i():DataGridColumn
        {
            var _local_1:DataGridColumn = new DataGridColumn();
            _CrossContentionSinglePanel_DataGridColumn4 = _local_1;
            _local_1.width = 30;
            _local_1.dataField = "num";
            BindingManager.executeBindings(this, "_CrossContentionSinglePanel_DataGridColumn4", _CrossContentionSinglePanel_DataGridColumn4);
            return (_local_1);
        }

        public function set bossLag(_arg_1:Label):void
        {
            var _local_2:Object = this._68590309bossLag;
            if (_local_2 !== _arg_1)
            {
                this._68590309bossLag = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bossLag", _local_2, _arg_1));
            };
        }

        private function onGetTotalStateData(_arg_1:Object):void
        {
            var _local_2:Object;
            var _local_3:Object;
            for (_local_2 in _arg_1)
            {
                _local_3 = {};
                totaStateList.addItem(_local_3);
            };
        }

        override public function initView():void
        {
            mapInit();
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
        }

        public function mapRefresh():void
        {
            var _local_3:CrossContentionIcon;
            var _local_1:Object = GamePredef.CROSS_CONTENTION_P_DATA[GamePredef.CROSS_CONTENTION_MAP_REC_INIT[MAP_ID]];
            bg.source = ResManager.getIconUrl(Number(_local_1.bp));
            var _local_2:Object = GamePredef.CROSS_CONTENTION_BOSS_DATA[MAP_ID].data;
            var _local_4:int;
            while (_local_4 < Math.max(bossIcons.length, bossData.data.length))
            {
                _local_3 = bossIcons[_local_4];
                if (!_local_3)
                {
                    _local_3 = new CrossContentionIcon();
                    _local_3.buttonMode = true;
                    _local_3.isBoss = true;
                    bossIcons[_local_4] = _local_3;
                    container1.addChild(_local_3);
                };
                if (bossData.data[_local_4])
                {
                    _local_3.visible = true;
                    _local_3.index = _local_4;
                    _local_3.x = _local_2[_local_4].p[0];
                    _local_3.y = _local_2[_local_4].p[1];
                }
                else
                {
                    _local_3.visible = false;
                };
                _local_3.refersh();
                _local_4++;
            };
            var _local_5:Object = GamePredef.CROSS_CONTENTION_REC_TEMP_DATA[GamePredef.CROSS_CONTENTION_MAP_REC_INIT[MAP_ID]];
            _local_4 = 1;
            while (_local_4 < 101)
            {
                _local_3 = icons[_local_4];
                if (_local_3)
                {
                    _local_3.refersh();
                    if (_local_3.isBoss)
                    {
                        _local_3.x = GamePredef.CROSS_CONTENTION_BOSS_DATA[MAP_ID].data[0].p[0];
                        _local_3.y = GamePredef.CROSS_CONTENTION_BOSS_DATA[MAP_ID].data[0].p[1];
                    }
                    else
                    {
                        _local_3.x = _local_5[_local_4].x;
                        _local_3.y = _local_5[_local_4].y;
                    };
                };
                _local_4++;
            };
        }

        public function ___CrossContentionSinglePanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }


    }
}//package com.qeedoo.ui.view.compDragable

