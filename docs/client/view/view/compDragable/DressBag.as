// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.DressBag

package com.qeedoo.ui.view.compDragable
{
    import mx.containers.Canvas;
    import com.qeedoo.ui.view.comp.RecipeCell;
    import com.qeedoo.ui.view.comp.PageSelectorOnly;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Tile;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import com.adobe.serialization.json.JSON;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import mx.events.PropertyChangeEvent;
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

    public class DressBag extends Canvas 
    {

        public static const TYPE_RECIPE:int = 1;
        public static const TYPE_CHIP:int = 2;
        private static const PAGE_NUM:int = 25;

        private var _1027481139recipeCell14:RecipeCell;
        private var _1972807204recipeCell4:RecipeCell;
        private var _1027481170recipeCell24:RecipeCell;
        private var _1027481137recipeCell12:RecipeCell;
        private var _1027481140recipeCell15:RecipeCell;
        private var _1027481142recipeCell17:RecipeCell;
        private var _1027481144recipeCell19:RecipeCell;
        private var _1972807207recipeCell7:RecipeCell;
        private var _showType:int;
        private var _1972807202recipeCell2:RecipeCell;
        private var _1972807205recipeCell5:RecipeCell;
        private var _recipeArr:Array;
        private var _1027481166recipeCell20:RecipeCell;
        private var _1027481168recipeCell22:RecipeCell;
        private var _1027481136recipeCell11:RecipeCell;
        private var _1027481138recipeCell13:RecipeCell;
        private var _1972807200recipeCell0:RecipeCell;
        private var _1972807208recipeCell8:RecipeCell;
        private var _1027481141recipeCell16:RecipeCell;
        private var _1027481143recipeCell18:RecipeCell;
        private var _607339634pageSelector:PageSelectorOnly;
        private var _1972807203recipeCell3:RecipeCell;
        private var _1972807206recipeCell6:RecipeCell;
        private var _1972807201recipeCell1:RecipeCell;
        private var _1972807209recipeCell9:RecipeCell;
        private var _1027481167recipeCell21:RecipeCell;
        private var _1027481169recipeCell23:RecipeCell;
        private var _1027481135recipeCell10:RecipeCell;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":194,
                    "height":220,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Tile,
                        "stylesFactory":function ():void
                        {
                            this.horizontalGap = 6;
                            this.verticalGap = 6;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"childDescriptors":[new UIComponentDescriptor({
                                    "type":RecipeCell,
                                    "id":"recipeCell0"
                                }), new UIComponentDescriptor({
                                    "type":RecipeCell,
                                    "id":"recipeCell1"
                                }), new UIComponentDescriptor({
                                    "type":RecipeCell,
                                    "id":"recipeCell2"
                                }), new UIComponentDescriptor({
                                    "type":RecipeCell,
                                    "id":"recipeCell3"
                                }), new UIComponentDescriptor({
                                    "type":RecipeCell,
                                    "id":"recipeCell4"
                                }), new UIComponentDescriptor({
                                    "type":RecipeCell,
                                    "id":"recipeCell5"
                                }), new UIComponentDescriptor({
                                    "type":RecipeCell,
                                    "id":"recipeCell6"
                                }), new UIComponentDescriptor({
                                    "type":RecipeCell,
                                    "id":"recipeCell7"
                                }), new UIComponentDescriptor({
                                    "type":RecipeCell,
                                    "id":"recipeCell8"
                                }), new UIComponentDescriptor({
                                    "type":RecipeCell,
                                    "id":"recipeCell9"
                                }), new UIComponentDescriptor({
                                    "type":RecipeCell,
                                    "id":"recipeCell10"
                                }), new UIComponentDescriptor({
                                    "type":RecipeCell,
                                    "id":"recipeCell11"
                                }), new UIComponentDescriptor({
                                    "type":RecipeCell,
                                    "id":"recipeCell12"
                                }), new UIComponentDescriptor({
                                    "type":RecipeCell,
                                    "id":"recipeCell13"
                                }), new UIComponentDescriptor({
                                    "type":RecipeCell,
                                    "id":"recipeCell14"
                                }), new UIComponentDescriptor({
                                    "type":RecipeCell,
                                    "id":"recipeCell15"
                                }), new UIComponentDescriptor({
                                    "type":RecipeCell,
                                    "id":"recipeCell16"
                                }), new UIComponentDescriptor({
                                    "type":RecipeCell,
                                    "id":"recipeCell17"
                                }), new UIComponentDescriptor({
                                    "type":RecipeCell,
                                    "id":"recipeCell18"
                                }), new UIComponentDescriptor({
                                    "type":RecipeCell,
                                    "id":"recipeCell19"
                                }), new UIComponentDescriptor({
                                    "type":RecipeCell,
                                    "id":"recipeCell20"
                                }), new UIComponentDescriptor({
                                    "type":RecipeCell,
                                    "id":"recipeCell21"
                                }), new UIComponentDescriptor({
                                    "type":RecipeCell,
                                    "id":"recipeCell22"
                                }), new UIComponentDescriptor({
                                    "type":RecipeCell,
                                    "id":"recipeCell23"
                                }), new UIComponentDescriptor({
                                    "type":RecipeCell,
                                    "id":"recipeCell24"
                                })]});
                        }
                    }), new UIComponentDescriptor({
                        "type":PageSelectorOnly,
                        "id":"pageSelector",
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                            this.bottom = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "changeCall":updatePage,
                                "setChange":false
                            });
                        }
                    })]
                });
            }
        });
        private var _pageDict:Object = {};
        private var _core:Core = Core.getInstance();

        public function DressBag()
        {
            mx_internal::_document = this;
            this.width = 194;
            this.height = 220;
            this.clipContent = false;
            this.horizontalScrollPolicy = "off";
            this.verticalScrollPolicy = "off";
        }

        public function updateView(_arg_1:int):void
        {
            var _local_2:Object;
            var _local_3:Object;
            var _local_4:*;
            var _local_5:int;
            var _local_6:Object;
            _showType = _arg_1;
            _recipeArr = [];
            if (_core.player.dressInfo)
            {
                _local_2 = com.adobe.serialization.json.JSON.decode(_core.player.dressInfo);
                if (((_local_2) && (_local_2.recipe)))
                {
                    _local_3 = _local_2.recipe;
                    for (_local_4 in _local_3)
                    {
                        _local_5 = _local_3[_local_4];
                        if (_local_5 > 0)
                        {
                            _local_6 = GameData.d[GamePredef.TBL_RECIPE][_local_4];
                            if (!((!(_local_6)) || (!(_local_6.type == _showType))))
                            {
                                _recipeArr.push({
                                    "recipeId":_local_4,
                                    "recipeNum":_local_5
                                });
                            };
                        };
                    };
                };
            };
            pageSelector.totalPage = Math.ceil((_recipeArr.length / PAGE_NUM));
            if (_pageDict[_showType])
            {
                pageSelector.curPage = _pageDict[_showType];
            };
            _pageDict[_showType] = pageSelector.curPage;
            this.updatePage();
        }

        public function set pageSelector(_arg_1:PageSelectorOnly):void
        {
            var _local_2:Object = this._607339634pageSelector;
            if (_local_2 !== _arg_1)
            {
                this._607339634pageSelector = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pageSelector", _local_2, _arg_1));
            };
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

        [Bindable(event="propertyChange")]
        public function get recipeCell5():RecipeCell
        {
            return (this._1972807205recipeCell5);
        }

        [Bindable(event="propertyChange")]
        public function get recipeCell10():RecipeCell
        {
            return (this._1027481135recipeCell10);
        }

        [Bindable(event="propertyChange")]
        public function get recipeCell11():RecipeCell
        {
            return (this._1027481136recipeCell11);
        }

        [Bindable(event="propertyChange")]
        public function get recipeCell12():RecipeCell
        {
            return (this._1027481137recipeCell12);
        }

        [Bindable(event="propertyChange")]
        public function get recipeCell15():RecipeCell
        {
            return (this._1027481140recipeCell15);
        }

        [Bindable(event="propertyChange")]
        public function get recipeCell16():RecipeCell
        {
            return (this._1027481141recipeCell16);
        }

        [Bindable(event="propertyChange")]
        public function get recipeCell18():RecipeCell
        {
            return (this._1027481143recipeCell18);
        }

        [Bindable(event="propertyChange")]
        public function get recipeCell19():RecipeCell
        {
            return (this._1027481144recipeCell19);
        }

        [Bindable(event="propertyChange")]
        public function get recipeCell13():RecipeCell
        {
            return (this._1027481138recipeCell13);
        }

        [Bindable(event="propertyChange")]
        public function get recipeCell4():RecipeCell
        {
            return (this._1972807204recipeCell4);
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

        public function set recipeCell1(_arg_1:RecipeCell):void
        {
            var _local_2:Object = this._1972807201recipeCell1;
            if (_local_2 !== _arg_1)
            {
                this._1972807201recipeCell1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "recipeCell1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get recipeCell17():RecipeCell
        {
            return (this._1027481142recipeCell17);
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

        [Bindable(event="propertyChange")]
        public function get recipeCell20():RecipeCell
        {
            return (this._1027481166recipeCell20);
        }

        [Bindable(event="propertyChange")]
        public function get recipeCell21():RecipeCell
        {
            return (this._1027481167recipeCell21);
        }

        [Bindable(event="propertyChange")]
        public function get recipeCell22():RecipeCell
        {
            return (this._1027481168recipeCell22);
        }

        [Bindable(event="propertyChange")]
        public function get recipeCell23():RecipeCell
        {
            return (this._1027481169recipeCell23);
        }

        [Bindable(event="propertyChange")]
        public function get recipeCell24():RecipeCell
        {
            return (this._1027481170recipeCell24);
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

        [Bindable(event="propertyChange")]
        public function get recipeCell14():RecipeCell
        {
            return (this._1027481139recipeCell14);
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

        public function set recipeCell9(_arg_1:RecipeCell):void
        {
            var _local_2:Object = this._1972807209recipeCell9;
            if (_local_2 !== _arg_1)
            {
                this._1972807209recipeCell9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "recipeCell9", _local_2, _arg_1));
            };
        }

        public function set recipeCell10(_arg_1:RecipeCell):void
        {
            var _local_2:Object = this._1027481135recipeCell10;
            if (_local_2 !== _arg_1)
            {
                this._1027481135recipeCell10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "recipeCell10", _local_2, _arg_1));
            };
        }

        public function set recipeCell11(_arg_1:RecipeCell):void
        {
            var _local_2:Object = this._1027481136recipeCell11;
            if (_local_2 !== _arg_1)
            {
                this._1027481136recipeCell11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "recipeCell11", _local_2, _arg_1));
            };
        }

        public function set recipeCell12(_arg_1:RecipeCell):void
        {
            var _local_2:Object = this._1027481137recipeCell12;
            if (_local_2 !== _arg_1)
            {
                this._1027481137recipeCell12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "recipeCell12", _local_2, _arg_1));
            };
        }

        public function set recipeCell13(_arg_1:RecipeCell):void
        {
            var _local_2:Object = this._1027481138recipeCell13;
            if (_local_2 !== _arg_1)
            {
                this._1027481138recipeCell13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "recipeCell13", _local_2, _arg_1));
            };
        }

        public function set recipeCell14(_arg_1:RecipeCell):void
        {
            var _local_2:Object = this._1027481139recipeCell14;
            if (_local_2 !== _arg_1)
            {
                this._1027481139recipeCell14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "recipeCell14", _local_2, _arg_1));
            };
        }

        public function set recipeCell15(_arg_1:RecipeCell):void
        {
            var _local_2:Object = this._1027481140recipeCell15;
            if (_local_2 !== _arg_1)
            {
                this._1027481140recipeCell15 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "recipeCell15", _local_2, _arg_1));
            };
        }

        public function set recipeCell16(_arg_1:RecipeCell):void
        {
            var _local_2:Object = this._1027481141recipeCell16;
            if (_local_2 !== _arg_1)
            {
                this._1027481141recipeCell16 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "recipeCell16", _local_2, _arg_1));
            };
        }

        public function set recipeCell17(_arg_1:RecipeCell):void
        {
            var _local_2:Object = this._1027481142recipeCell17;
            if (_local_2 !== _arg_1)
            {
                this._1027481142recipeCell17 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "recipeCell17", _local_2, _arg_1));
            };
        }

        public function set recipeCell18(_arg_1:RecipeCell):void
        {
            var _local_2:Object = this._1027481143recipeCell18;
            if (_local_2 !== _arg_1)
            {
                this._1027481143recipeCell18 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "recipeCell18", _local_2, _arg_1));
            };
        }

        public function set recipeCell19(_arg_1:RecipeCell):void
        {
            var _local_2:Object = this._1027481144recipeCell19;
            if (_local_2 !== _arg_1)
            {
                this._1027481144recipeCell19 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "recipeCell19", _local_2, _arg_1));
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

        private function cleanView():void
        {
            var _local_2:RecipeCell;
            pageSelector.totalPage = 1;
            _pageDict[_showType] = pageSelector.curPage;
            var _local_1:int;
            while (_local_1 < PAGE_NUM)
            {
                _local_2 = this[("recipeCell" + _local_1)];
                _local_2.clean();
                _local_1++;
            };
        }

        override public function initialize():void
        {
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            super.initialize();
        }

        [Bindable(event="propertyChange")]
        public function get pageSelector():PageSelectorOnly
        {
            return (this._607339634pageSelector);
        }

        public function set recipeCell20(_arg_1:RecipeCell):void
        {
            var _local_2:Object = this._1027481166recipeCell20;
            if (_local_2 !== _arg_1)
            {
                this._1027481166recipeCell20 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "recipeCell20", _local_2, _arg_1));
            };
        }

        public function set recipeCell21(_arg_1:RecipeCell):void
        {
            var _local_2:Object = this._1027481167recipeCell21;
            if (_local_2 !== _arg_1)
            {
                this._1027481167recipeCell21 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "recipeCell21", _local_2, _arg_1));
            };
        }

        public function set recipeCell22(_arg_1:RecipeCell):void
        {
            var _local_2:Object = this._1027481168recipeCell22;
            if (_local_2 !== _arg_1)
            {
                this._1027481168recipeCell22 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "recipeCell22", _local_2, _arg_1));
            };
        }

        public function set recipeCell23(_arg_1:RecipeCell):void
        {
            var _local_2:Object = this._1027481169recipeCell23;
            if (_local_2 !== _arg_1)
            {
                this._1027481169recipeCell23 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "recipeCell23", _local_2, _arg_1));
            };
        }

        public function set recipeCell24(_arg_1:RecipeCell):void
        {
            var _local_2:Object = this._1027481170recipeCell24;
            if (_local_2 !== _arg_1)
            {
                this._1027481170recipeCell24 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "recipeCell24", _local_2, _arg_1));
            };
        }

        public function makeAll():void
        {
            if (_showType != TYPE_CHIP)
            {
                return;
            };
            _core.remote.call("makeAllChips", new Responder(DressLogic.updateDressInfo));
        }

        public function get showType():int
        {
            return (_showType);
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
            _pageDict[_showType] = pageSelector.curPage;
            var _local_1:int = ((pageSelector.curPage - 1) * PAGE_NUM);
            var _local_2:int = (_local_1 + PAGE_NUM);
            var _local_3:int = _local_1;
            while (_local_3 < _local_2)
            {
                _local_4 = (_local_3 - _local_1);
                _local_5 = this[("recipeCell" + _local_4)];
                _local_6 = _recipeArr[_local_3];
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

