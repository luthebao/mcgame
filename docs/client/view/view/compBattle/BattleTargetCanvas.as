// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compBattle.BattleTargetCanvas

package com.qeedoo.ui.view.compBattle
{
    import com.qeedoo.ui.view.comp.SimpleCanvas;
    import mx.controls.Image;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.ui.view.compGameStage.BattleCreatureView;
    import flash.events.MouseEvent;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.predef.GamePredef;
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

    public class BattleTargetCanvas extends SimpleCanvas 
    {

        private var _3645t1:Image;
        private var _98786ct3:Image;
        private var _3647t3:Image;
        private var _114999tp3:Image;
        private var _98785ct2:Image;
        private var _114998tp2:Image;
        private var _3644t0:Image;
        private var _3646t2:Image;
        private var _3648t4:Image;
        private var _98784ct1:Image;
        private var _114997tp1:Image;
        private var _115000tp4:Image;
        private var _98783ct0:Image;
        private var _3064305ctp0:Image;
        private var _3064306ctp1:Image;
        private var _98787ct4:Image;
        private var _114996tp0:Image;
        private var _3064309ctp4:Image;
        private var _3064307ctp2:Image;
        private var _3064308ctp3:Image;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":SimpleCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":325,
                    "height":58,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Image,
                        "id":"ct0",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":2,
                                "y":2,
                                "width":30,
                                "height":30,
                                "visible":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"ctp0",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":2,
                                "y":34,
                                "width":30,
                                "height":30,
                                "visible":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"ct1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":34,
                                "y":2,
                                "width":30,
                                "height":30,
                                "visible":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"ctp1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":34,
                                "y":34,
                                "width":30,
                                "height":30,
                                "visible":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"ct2",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":66,
                                "y":2,
                                "width":30,
                                "height":30,
                                "visible":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"ctp2",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":66,
                                "y":34,
                                "width":30,
                                "height":30,
                                "visible":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"ct3",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":98,
                                "y":2,
                                "width":30,
                                "height":30,
                                "visible":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"ctp3",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":98,
                                "y":34,
                                "width":30,
                                "height":30,
                                "visible":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"ct4",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":130,
                                "y":2,
                                "width":30,
                                "height":30,
                                "visible":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"ctp4",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":130,
                                "y":34,
                                "width":30,
                                "height":30,
                                "visible":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"t0",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":170,
                                "y":2,
                                "width":30,
                                "height":30,
                                "visible":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"tp0",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":170,
                                "y":34,
                                "width":30,
                                "height":30,
                                "visible":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"t1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":202,
                                "y":2,
                                "width":30,
                                "height":30,
                                "visible":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"tp1",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":202,
                                "y":34,
                                "width":30,
                                "height":30,
                                "visible":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"t2",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":234,
                                "y":2,
                                "width":30,
                                "height":30,
                                "visible":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"tp2",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":234,
                                "y":34,
                                "width":30,
                                "height":30,
                                "visible":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"t3",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":266,
                                "y":2,
                                "width":30,
                                "height":30,
                                "visible":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"tp3",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":266,
                                "y":34,
                                "width":30,
                                "height":30,
                                "visible":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"t4",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":298,
                                "y":2,
                                "width":30,
                                "height":30,
                                "visible":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"tp4",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":298,
                                "y":34,
                                "width":30,
                                "height":30,
                                "visible":false
                            });
                        }
                    })]
                });
            }
        });
        private var _showData:Object = {};

        public function BattleTargetCanvas()
        {
            mx_internal::_document = this;
            this.width = 325;
            this.height = 58;
            this.addEventListener("creationComplete", ___BattleTargetCanvas_SimpleCanvas1_creationComplete);
        }

        public function set t1(_arg_1:Image):void
        {
            var _local_2:Object = this._3645t1;
            if (_local_2 !== _arg_1)
            {
                this._3645t1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "t1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get ctp2():Image
        {
            return (this._3064307ctp2);
        }

        private function imgDown(_arg_1:MouseEvent):void
        {
            var _local_3:BattleCreatureView;
            var _local_2:Image = Image(_arg_1.currentTarget);
            if (_local_2.data)
            {
                if ((_local_2.data is BattleCreatureView))
                {
                    _local_3 = BattleCreatureView(_local_2.data);
                    if (_local_3._cg)
                    {
                        _local_3._cg.dispatchEvent(_arg_1);
                    }
                    else
                    {
                        if (_local_3.defaultCg)
                        {
                            _local_3.defaultCg.dispatchEvent(_arg_1);
                        };
                    };
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get ctp0():Image
        {
            return (this._3064305ctp0);
        }

        public function set tp0(_arg_1:Image):void
        {
            var _local_2:Object = this._114996tp0;
            if (_local_2 !== _arg_1)
            {
                this._114996tp0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tp0", _local_2, _arg_1));
            };
        }

        private function activeImage(_arg_1:Image, _arg_2:Object):void
        {
            _arg_1.visible = true;
            _arg_1.source = ResManager.getIconUrl(_arg_2.gameObject.iconCode);
            ResManager.setColorCode(_arg_1, _arg_2.gameObject.colorCode);
            _arg_1.data = _arg_2;
            _arg_1.toolTip = _arg_2.gameObject.name;
            _arg_1.addEventListener(MouseEvent.ROLL_OVER, imgOver);
            _arg_1.addEventListener(MouseEvent.ROLL_OUT, imgOut);
            _arg_1.addEventListener(MouseEvent.MOUSE_DOWN, imgDown);
        }

        public function set showData(_arg_1:Object):void
        {
            var _local_3:int;
            var _local_4:Object;
            var _local_5:BattleCreatureView;
            var _local_6:BattleCreatureView;
            _showData = _arg_1;
            var _local_2:int;
            while (_local_2 < 5)
            {
                _local_3 = (10 + _local_2);
                if (_arg_1[_local_2])
                {
                    _local_4 = _arg_1[_local_2];
                    deactiveImage(Image(this[("ct" + _local_2)]));
                    if (_local_4["c"])
                    {
                        _local_5 = BattleCreatureView(_local_4["c"]);
                        if (_local_5.visible)
                        {
                            activeImage(Image(this[("ct" + _local_2)]), _local_5);
                        };
                    };
                    deactiveImage(Image(this[("ctp" + _local_2)]));
                    if (_local_4["p"])
                    {
                        _local_5 = BattleCreatureView(_local_4["p"]);
                        if (_local_5.visible)
                        {
                            activeImage(Image(this[("ctp" + _local_2)]), _local_5);
                        };
                    };
                };
                if (_arg_1[_local_3])
                {
                    _local_4 = _arg_1[_local_3];
                    deactiveImage(Image(this[("t" + _local_2)]));
                    if (_local_4["c"])
                    {
                        _local_6 = BattleCreatureView(_local_4["c"]);
                        if (_local_6.visible)
                        {
                            activeImage(Image(this[("t" + _local_2)]), _local_6);
                        };
                    };
                    deactiveImage(Image(this[("tp" + _local_2)]));
                    if (_local_4["p"])
                    {
                        _local_6 = BattleCreatureView(_local_4["p"]);
                        if (_local_6.visible)
                        {
                            activeImage(Image(this[("tp" + _local_2)]), _local_6);
                        };
                    };
                };
                _local_2++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get ct3():Image
        {
            return (this._98786ct3);
        }

        override public function initialize():void
        {
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            super.initialize();
        }

        private function imgOut(_arg_1:MouseEvent):void
        {
            var _local_4:BattleCreatureView;
            var _local_2:Image = Image(_arg_1.currentTarget);
            var _local_3:Array = _local_2.filters;
            _local_3.pop();
            _local_2.filters = _local_3;
            if (_local_2.data)
            {
                if ((_local_2.data is BattleCreatureView))
                {
                    _local_4 = BattleCreatureView(_local_2.data);
                    if (_local_4._cg)
                    {
                        _local_4._cg.dispatchEvent(_arg_1);
                    }
                    else
                    {
                        if (_local_4.defaultCg)
                        {
                            _local_4.defaultCg.dispatchEvent(_arg_1);
                        };
                    };
                };
            };
        }

        public function set t2(_arg_1:Image):void
        {
            var _local_2:Object = this._3646t2;
            if (_local_2 !== _arg_1)
            {
                this._3646t2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "t2", _local_2, _arg_1));
            };
        }

        public function set t4(_arg_1:Image):void
        {
            var _local_2:Object = this._3648t4;
            if (_local_2 !== _arg_1)
            {
                this._3648t4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "t4", _local_2, _arg_1));
            };
        }

        public function clearView():void
        {
            var _local_1:int;
            while (_local_1 < 5)
            {
                this[("t" + _local_1)].visible = false;
                this[("t" + _local_1)].removeEventListener(MouseEvent.ROLL_OVER, imgOver);
                this[("t" + _local_1)].removeEventListener(MouseEvent.ROLL_OUT, imgOut);
                this[("t" + _local_1)].removeEventListener(MouseEvent.MOUSE_DOWN, imgDown);
                this[("tp" + _local_1)].visible = false;
                this[("tp" + _local_1)].removeEventListener(MouseEvent.ROLL_OVER, imgOver);
                this[("tp" + _local_1)].removeEventListener(MouseEvent.ROLL_OUT, imgOut);
                this[("tp" + _local_1)].removeEventListener(MouseEvent.MOUSE_DOWN, imgDown);
                this[("ct" + _local_1)].visible = false;
                this[("ct" + _local_1)].removeEventListener(MouseEvent.ROLL_OVER, imgOver);
                this[("ct" + _local_1)].removeEventListener(MouseEvent.ROLL_OUT, imgOut);
                this[("ct" + _local_1)].removeEventListener(MouseEvent.MOUSE_DOWN, imgDown);
                this[("ctp" + _local_1)].visible = false;
                this[("ctp" + _local_1)].removeEventListener(MouseEvent.ROLL_OVER, imgOver);
                this[("ctp" + _local_1)].removeEventListener(MouseEvent.ROLL_OUT, imgOut);
                this[("ctp" + _local_1)].removeEventListener(MouseEvent.MOUSE_DOWN, imgDown);
                _local_1++;
            };
        }

        public function set ctp0(_arg_1:Image):void
        {
            var _local_2:Object = this._3064305ctp0;
            if (_local_2 !== _arg_1)
            {
                this._3064305ctp0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ctp0", _local_2, _arg_1));
            };
        }

        private function init():void
        {
        }

        public function set t3(_arg_1:Image):void
        {
            var _local_2:Object = this._3647t3;
            if (_local_2 !== _arg_1)
            {
                this._3647t3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "t3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get t2():Image
        {
            return (this._3646t2);
        }

        [Bindable(event="propertyChange")]
        public function get ctp4():Image
        {
            return (this._3064309ctp4);
        }

        public function set ctp4(_arg_1:Image):void
        {
            var _local_2:Object = this._3064309ctp4;
            if (_local_2 !== _arg_1)
            {
                this._3064309ctp4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ctp4", _local_2, _arg_1));
            };
        }

        public function set ctp2(_arg_1:Image):void
        {
            var _local_2:Object = this._3064307ctp2;
            if (_local_2 !== _arg_1)
            {
                this._3064307ctp2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ctp2", _local_2, _arg_1));
            };
        }

        public function set tp1(_arg_1:Image):void
        {
            var _local_2:Object = this._114997tp1;
            if (_local_2 !== _arg_1)
            {
                this._114997tp1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tp1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get tp0():Image
        {
            return (this._114996tp0);
        }

        [Bindable(event="propertyChange")]
        public function get tp2():Image
        {
            return (this._114998tp2);
        }

        private function imgOver(_arg_1:MouseEvent):void
        {
            var _local_4:BattleCreatureView;
            var _local_2:Image = Image(_arg_1.currentTarget);
            var _local_3:Array = _local_2.filters;
            _local_3.push(GamePredef.FILTER_SLOT_SELECTED);
            _local_2.filters = _local_3;
            if (_local_2.data)
            {
                if ((_local_2.data is BattleCreatureView))
                {
                    _local_4 = BattleCreatureView(_local_2.data);
                    if (_local_4._cg)
                    {
                        _local_4._cg.dispatchEvent(_arg_1);
                    }
                    else
                    {
                        if (_local_4.defaultCg)
                        {
                            _local_4.defaultCg.dispatchEvent(_arg_1);
                        };
                    };
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get tp4():Image
        {
            return (this._115000tp4);
        }

        [Bindable(event="propertyChange")]
        public function get t1():Image
        {
            return (this._3645t1);
        }

        [Bindable(event="propertyChange")]
        public function get t3():Image
        {
            return (this._3647t3);
        }

        public function set ct1(_arg_1:Image):void
        {
            var _local_2:Object = this._98784ct1;
            if (_local_2 !== _arg_1)
            {
                this._98784ct1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ct1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get t0():Image
        {
            return (this._3644t0);
        }

        public function set ct3(_arg_1:Image):void
        {
            var _local_2:Object = this._98786ct3;
            if (_local_2 !== _arg_1)
            {
                this._98786ct3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ct3", _local_2, _arg_1));
            };
        }

        public function set ct0(_arg_1:Image):void
        {
            var _local_2:Object = this._98783ct0;
            if (_local_2 !== _arg_1)
            {
                this._98783ct0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ct0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get t4():Image
        {
            return (this._3648t4);
        }

        public function set ct2(_arg_1:Image):void
        {
            var _local_2:Object = this._98785ct2;
            if (_local_2 !== _arg_1)
            {
                this._98785ct2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ct2", _local_2, _arg_1));
            };
        }

        public function set ct4(_arg_1:Image):void
        {
            var _local_2:Object = this._98787ct4;
            if (_local_2 !== _arg_1)
            {
                this._98787ct4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ct4", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get tp3():Image
        {
            return (this._114999tp3);
        }

        private function deactiveImage(_arg_1:Image):void
        {
            _arg_1.visible = false;
        }

        [Bindable(event="propertyChange")]
        public function get tp1():Image
        {
            return (this._114997tp1);
        }

        [Bindable(event="propertyChange")]
        public function get ct0():Image
        {
            return (this._98783ct0);
        }

        [Bindable(event="propertyChange")]
        public function get ct1():Image
        {
            return (this._98784ct1);
        }

        [Bindable(event="propertyChange")]
        public function get ct2():Image
        {
            return (this._98785ct2);
        }

        [Bindable(event="propertyChange")]
        public function get ct4():Image
        {
            return (this._98787ct4);
        }

        public function set ctp1(_arg_1:Image):void
        {
            var _local_2:Object = this._3064306ctp1;
            if (_local_2 !== _arg_1)
            {
                this._3064306ctp1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ctp1", _local_2, _arg_1));
            };
        }

        public function set ctp3(_arg_1:Image):void
        {
            var _local_2:Object = this._3064308ctp3;
            if (_local_2 !== _arg_1)
            {
                this._3064308ctp3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ctp3", _local_2, _arg_1));
            };
        }

        public function velidateImgVisible():void
        {
            var _local_1:int;
            while (_local_1 < 5)
            {
                if (this[("t" + _local_1)].visible)
                {
                    if (((!(this[("t" + _local_1)].data)) || (!(this[("t" + _local_1)].data.visible))))
                    {
                        deactiveImage(Image(this[("t" + _local_1)]));
                    };
                };
                if (this[("tp" + _local_1)].visible)
                {
                    if (((!(this[("tp" + _local_1)].data)) || (!(this[("tp" + _local_1)].data.visible))))
                    {
                        deactiveImage(Image(this[("tp" + _local_1)]));
                    };
                };
                if (this[("ct" + _local_1)].visible)
                {
                    if (((!(this[("ct" + _local_1)].data)) || (!(this[("ct" + _local_1)].data.visible))))
                    {
                        deactiveImage(Image(this[("ct" + _local_1)]));
                    };
                };
                if (this[("ctp" + _local_1)].visible)
                {
                    if (((!(this[("ctp" + _local_1)].data)) || (!(this[("ctp" + _local_1)].data.visible))))
                    {
                        deactiveImage(Image(this[("ctp" + _local_1)]));
                    };
                };
                _local_1++;
            };
        }

        public function set tp4(_arg_1:Image):void
        {
            var _local_2:Object = this._115000tp4;
            if (_local_2 !== _arg_1)
            {
                this._115000tp4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tp4", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get ctp3():Image
        {
            return (this._3064308ctp3);
        }

        [Bindable(event="propertyChange")]
        public function get ctp1():Image
        {
            return (this._3064306ctp1);
        }

        public function set tp2(_arg_1:Image):void
        {
            var _local_2:Object = this._114998tp2;
            if (_local_2 !== _arg_1)
            {
                this._114998tp2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tp2", _local_2, _arg_1));
            };
        }

        public function set tp3(_arg_1:Image):void
        {
            var _local_2:Object = this._114999tp3;
            if (_local_2 !== _arg_1)
            {
                this._114999tp3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tp3", _local_2, _arg_1));
            };
        }

        public function ___BattleTargetCanvas_SimpleCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        public function set t0(_arg_1:Image):void
        {
            var _local_2:Object = this._3644t0;
            if (_local_2 !== _arg_1)
            {
                this._3644t0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "t0", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.compBattle

