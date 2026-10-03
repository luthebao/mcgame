// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.RecipeAlertTen

package com.qeedoo.ui.view.compDragable
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.RecipeCell;
    import com.qeedoo.ui.view.comp.FilterButton;
    import mx.controls.Label;
    import mx.controls.Button;
    import mx.core.UIComponentDescriptor;
    import mx.containers.HBox;
    import mx.containers.Tile;
    import mx.core.mx_internal;
    import mx.managers.PopUpManager;
    import mx.core.Application;
    import flash.display.DisplayObject;
    import flash.events.MouseEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
    import flash.events.Event;
    import mx.events.PropertyChangeEvent;
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

    public class RecipeAlertTen extends Canvas implements IBindingClient 
    {

        public static var _instance:RecipeAlertTen;
        private static const PAGE_NUM:int = 10;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1972807204recipeCell4:RecipeCell;
        private var _1972807208recipeCell8:RecipeCell;
        private var _1972807200recipeCell0:RecipeCell;
        public var _RecipeAlertTen_FilterButton1:FilterButton;
        private var _1972807207recipeCell7:RecipeCell;
        private var _curPage:int = 1;
        public var _RecipeAlertTen_Label1:Label;
        private var _548260570nextPageBtn:Button;
        private var _1972807203recipeCell3:RecipeCell;
        private var _1972807202recipeCell2:RecipeCell;
        private var _1972807206recipeCell6:RecipeCell;
        private var _365206826prePageBtn:Button;
        private var _1972807209recipeCell9:RecipeCell;
        private var _1972807201recipeCell1:RecipeCell;
        private var _recipeArr:Array;
        private var _1972807205recipeCell5:RecipeCell;
        private var _totalPage:int = 1;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":240,
                    "height":140,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Label,
                        "id":"_RecipeAlertTen_Label1",
                        "stylesFactory":function ():void
                        {
                            this.textAlign = "center";
                            this.color = 0xFFFFFF;
                            this.horizontalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"y":10});
                        }
                    }), new UIComponentDescriptor({
                        "type":HBox,
                        "stylesFactory":function ():void
                        {
                            this.horizontalGap = 3;
                            this.verticalAlign = "middle";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":30,
                                "x":8,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"prePageBtn",
                                    "events":{"click":"__prePageBtn_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"EquLastPage",
                                            "enabled":false,
                                            "visible":false
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Tile,
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalGap = 6;
                                        this.verticalGap = 6;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":194,
                                            "height":74,
                                            "verticalScrollPolicy":"off",
                                            "horizontalScrollPolicy":"off",
                                            "clipContent":false,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":RecipeCell,
                                                "id":"recipeCell0",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "inPopUp":true,
                                                        "visible":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RecipeCell,
                                                "id":"recipeCell1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "inPopUp":true,
                                                        "visible":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RecipeCell,
                                                "id":"recipeCell2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "inPopUp":true,
                                                        "visible":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RecipeCell,
                                                "id":"recipeCell3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "inPopUp":true,
                                                        "visible":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RecipeCell,
                                                "id":"recipeCell4",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "inPopUp":true,
                                                        "visible":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RecipeCell,
                                                "id":"recipeCell5",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "inPopUp":true,
                                                        "visible":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RecipeCell,
                                                "id":"recipeCell6",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "inPopUp":true,
                                                        "visible":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RecipeCell,
                                                "id":"recipeCell7",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "inPopUp":true,
                                                        "visible":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RecipeCell,
                                                "id":"recipeCell8",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "inPopUp":true,
                                                        "visible":false
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RecipeCell,
                                                "id":"recipeCell9",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "inPopUp":true,
                                                        "visible":false
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"nextPageBtn",
                                    "events":{"click":"__nextPageBtn_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"EquNextPage",
                                            "enabled":false,
                                            "visible":false
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":FilterButton,
                        "id":"_RecipeAlertTen_FilterButton1",
                        "events":{"click":"___RecipeAlertTen_FilterButton1_click"},
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":110,
                                "styleName":"BtnStdGreen",
                                "width":60,
                                "height":23
                            });
                        }
                    })]
                });
            }
        });
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function RecipeAlertTen()
        {
            mx_internal::_document = this;
            this.width = 240;
            this.height = 140;
            this.styleName = "CanvasPopup";
            this.verticalScrollPolicy = "off";
            this.horizontalScrollPolicy = "off";
            this.clipContent = false;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            RecipeAlertTen._watcherSetupUtil = _arg_1;
        }

        public static function show(_arg_1:Array):void
        {
            _instance = ((_instance) || (new (RecipeAlertTen)()));
            PopUpManager.removePopUp(_instance);
            PopUpManager.addPopUp(_instance, (Application.application as DisplayObject), true);
            PopUpManager.centerPopUp(_instance);
            _instance.updateView(_arg_1);
        }


        public function __nextPageBtn_click(_arg_1:MouseEvent):void
        {
            pageHanlder(true);
        }

        private function updateView(_arg_1:Array):void
        {
            var _local_2:Boolean;
            _recipeArr = _arg_1;
            _local_2 = (_arg_1.length > PAGE_NUM);
            prePageBtn.visible = _local_2;
            nextPageBtn.visible = _local_2;
            _totalPage = Math.ceil((_arg_1.length / PAGE_NUM));
            if ((_curPage > _totalPage))
            {
                _curPage = _totalPage;
            };
            this.checkBtnEnable();
            this.updatePage();
        }

        override public function initialize():void
        {
            var target:RecipeAlertTen;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _RecipeAlertTen_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_RecipeAlertTenWatcherSetupUtil");
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

        public function __prePageBtn_click(_arg_1:MouseEvent):void
        {
            pageHanlder(false);
        }

        private function cleanView():void
        {
            var _local_2:RecipeCell;
            _curPage = 1;
            _totalPage = 1;
            _recipeArr = null;
            this.checkBtnEnable();
            prePageBtn.visible = false;
            nextPageBtn.visible = false;
            prePageBtn.enabled = false;
            nextPageBtn.enabled = false;
            var _local_1:int;
            while (_local_1 < PAGE_NUM)
            {
                _local_2 = this[("recipeCell" + _local_1)];
                _local_2.visible = false;
                _local_2.clean();
                _local_1++;
            };
        }

        override protected function createChildren():void
        {
            super.createChildren();
            this.setStyle("modalTransparency", 0);
            this.setStyle("modalTransparencyBlur", 0);
        }

        private function _RecipeAlertTen_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DRESS_PANEL[37];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _RecipeAlertTen_Label1.text = _arg_1;
            }, "_RecipeAlertTen_Label1.text");
            result[0] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _RecipeAlertTen_Label1.filters = _arg_1;
            }, "_RecipeAlertTen_Label1.filters");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.DRESS_PANEL[38];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _RecipeAlertTen_FilterButton1.label = _arg_1;
            }, "_RecipeAlertTen_FilterButton1.label");
            result[2] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_GLOW_LOWBLACK]);
            }, function (_arg_1:Array):void
            {
                _RecipeAlertTen_FilterButton1.filters = _arg_1;
            }, "_RecipeAlertTen_FilterButton1.filters");
            result[3] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get recipeCell0():RecipeCell
        {
            return (this._1972807200recipeCell0);
        }

        [Bindable(event="propertyChange")]
        public function get recipeCell1():RecipeCell
        {
            return (this._1972807201recipeCell1);
        }

        [Bindable(event="propertyChange")]
        public function get recipeCell2():RecipeCell
        {
            return (this._1972807202recipeCell2);
        }

        [Bindable(event="propertyChange")]
        public function get recipeCell3():RecipeCell
        {
            return (this._1972807203recipeCell3);
        }

        [Bindable(event="propertyChange")]
        public function get recipeCell4():RecipeCell
        {
            return (this._1972807204recipeCell4);
        }

        [Bindable(event="propertyChange")]
        public function get recipeCell6():RecipeCell
        {
            return (this._1972807206recipeCell6);
        }

        [Bindable(event="propertyChange")]
        public function get recipeCell7():RecipeCell
        {
            return (this._1972807207recipeCell7);
        }

        [Bindable(event="propertyChange")]
        public function get recipeCell8():RecipeCell
        {
            return (this._1972807208recipeCell8);
        }

        [Bindable(event="propertyChange")]
        public function get recipeCell9():RecipeCell
        {
            return (this._1972807209recipeCell9);
        }

        private function _RecipeAlertTen_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.DRESS_PANEL[37];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
            _local_1 = Language.DRESS_PANEL[38];
            _local_1 = [GamePredef.FILTER_GLOW_LOWBLACK];
        }

        [Bindable(event="propertyChange")]
        public function get prePageBtn():Button
        {
            return (this._365206826prePageBtn);
        }

        private function closeHandler(_arg_1:Event):void
        {
            _arg_1.stopImmediatePropagation();
            PopUpManager.removePopUp(this);
        }

        public function set nextPageBtn(_arg_1:Button):void
        {
            var _local_2:Object = this._548260570nextPageBtn;
            if (_local_2 !== _arg_1)
            {
                this._548260570nextPageBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nextPageBtn", _local_2, _arg_1));
            };
        }

        private function pageHanlder(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                _curPage++;
                if (_curPage > _totalPage)
                {
                    _curPage = _totalPage;
                    return;
                };
            }
            else
            {
                _curPage--;
                if (_curPage < 0)
                {
                    _curPage = 0;
                    return;
                };
            };
            this.checkBtnEnable();
            this.updatePage();
        }

        [Bindable(event="propertyChange")]
        public function get recipeCell5():RecipeCell
        {
            return (this._1972807205recipeCell5);
        }

        public function ___RecipeAlertTen_FilterButton1_click(_arg_1:MouseEvent):void
        {
            closeHandler(_arg_1);
        }

        public function set recipeCell0(_arg_1:RecipeCell):void
        {
            var _local_2:Object = this._1972807200recipeCell0;
            if (_local_2 !== _arg_1)
            {
                this._1972807200recipeCell0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "recipeCell0", _local_2, _arg_1));
            };
        }

        public function set recipeCell2(_arg_1:RecipeCell):void
        {
            var _local_2:Object = this._1972807202recipeCell2;
            if (_local_2 !== _arg_1)
            {
                this._1972807202recipeCell2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "recipeCell2", _local_2, _arg_1));
            };
        }

        public function set recipeCell3(_arg_1:RecipeCell):void
        {
            var _local_2:Object = this._1972807203recipeCell3;
            if (_local_2 !== _arg_1)
            {
                this._1972807203recipeCell3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "recipeCell3", _local_2, _arg_1));
            };
        }

        public function set recipeCell4(_arg_1:RecipeCell):void
        {
            var _local_2:Object = this._1972807204recipeCell4;
            if (_local_2 !== _arg_1)
            {
                this._1972807204recipeCell4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "recipeCell4", _local_2, _arg_1));
            };
        }

        public function set recipeCell1(_arg_1:RecipeCell):void
        {
            var _local_2:Object = this._1972807201recipeCell1;
            if (_local_2 !== _arg_1)
            {
                this._1972807201recipeCell1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "recipeCell1", _local_2, _arg_1));
            };
        }

        public function set recipeCell7(_arg_1:RecipeCell):void
        {
            var _local_2:Object = this._1972807207recipeCell7;
            if (_local_2 !== _arg_1)
            {
                this._1972807207recipeCell7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "recipeCell7", _local_2, _arg_1));
            };
        }

        public function set recipeCell8(_arg_1:RecipeCell):void
        {
            var _local_2:Object = this._1972807208recipeCell8;
            if (_local_2 !== _arg_1)
            {
                this._1972807208recipeCell8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "recipeCell8", _local_2, _arg_1));
            };
        }

        public function set recipeCell5(_arg_1:RecipeCell):void
        {
            var _local_2:Object = this._1972807205recipeCell5;
            if (_local_2 !== _arg_1)
            {
                this._1972807205recipeCell5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "recipeCell5", _local_2, _arg_1));
            };
        }

        public function set recipeCell6(_arg_1:RecipeCell):void
        {
            var _local_2:Object = this._1972807206recipeCell6;
            if (_local_2 !== _arg_1)
            {
                this._1972807206recipeCell6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "recipeCell6", _local_2, _arg_1));
            };
        }

        public function set prePageBtn(_arg_1:Button):void
        {
            var _local_2:Object = this._365206826prePageBtn;
            if (_local_2 !== _arg_1)
            {
                this._365206826prePageBtn = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "prePageBtn", _local_2, _arg_1));
            };
        }

        private function checkBtnEnable():void
        {
            prePageBtn.enabled = (_curPage > 1);
            nextPageBtn.enabled = (_curPage < _totalPage);
        }

        public function set recipeCell9(_arg_1:RecipeCell):void
        {
            var _local_2:Object = this._1972807209recipeCell9;
            if (_local_2 !== _arg_1)
            {
                this._1972807209recipeCell9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "recipeCell9", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get nextPageBtn():Button
        {
            return (this._548260570nextPageBtn);
        }

        private function updatePage():void
        {
            var _local_4:int;
            var _local_5:RecipeCell;
            var _local_6:Object;
            if (((!(_recipeArr)) || (_recipeArr.length <= 0)))
            {
                this.cleanView();
                return;
            };
            var _local_1:int = ((_curPage - 1) * PAGE_NUM);
            var _local_2:int = (_local_1 + PAGE_NUM);
            var _local_3:int = _local_1;
            while (_local_3 < _local_2)
            {
                _local_4 = (_local_3 - _local_1);
                _local_5 = this[("recipeCell" + _local_4)];
                _local_6 = _recipeArr[_local_3];
                _local_5.visible = (!(_local_6 == null));
                if (!_local_6)
                {
                    _local_5.clean();
                }
                else
                {
                    _local_5.stackNum = _local_6.recipeNum;
                    _local_5.recipeId = _local_6.recipeId;
                };
                _local_3++;
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

