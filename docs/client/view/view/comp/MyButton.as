// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.MyButton

package com.qeedoo.ui.view.comp
{
    import mx.core.UIComponent;
    import flash.text.TextField;
    import flash.events.MouseEvent;
    import com.qeedoo.game.predef.GamePredef;
    import flash.text.TextFormat;
    import flash.filters.ColorMatrixFilter;
    import flash.geom.Rectangle;
    import flash.geom.Point;
    import flash.display.DisplayObject;
    import flash.display.BitmapData;
    import flash.geom.Matrix;
    import flash.display.Bitmap;

    public class MyButton extends UIComponent 
    {

        private var _orient_horizon:Boolean = false;
        private var _enabled:Boolean = true;
        private var _progress:Number = 1;
        private var _textField:TextField;
        private var _skin:Class;
        private var _clickFunc:Function;
        private var _selected:Boolean = false;

        public function MyButton()
        {
            this.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            this.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            this.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
            this.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
            this.addEventListener(MouseEvent.CLICK, onClick);
        }

        private function onMouseOver(_arg_1:MouseEvent):void
        {
            if (((this._enabled) && (!(this._selected))))
            {
                this.filters = [GamePredef.FILTER_SLOT_SELECTED];
            };
        }

        private function onMouseDown(_arg_1:MouseEvent):void
        {
        }

        public function set orient(_arg_1:Boolean):void
        {
            _orient_horizon = _arg_1;
        }

        public function set clickHandler(_arg_1:Function):void
        {
            this._clickFunc = _arg_1;
        }

        private function onMouseUp(_arg_1:MouseEvent):void
        {
        }

        override public function set enabled(_arg_1:Boolean):void
        {
            super.enabled = _arg_1;
            if (this._enabled != _arg_1)
            {
                this._enabled = _arg_1;
                if (!_arg_1)
                {
                    this.filters = [GamePredef.FILTER_SLOT_SKILL_01];
                }
                else
                {
                    this.filters = null;
                };
            };
        }

        public function set skin(_arg_1:Class):void
        {
            if (_skin != _arg_1)
            {
                restSkin(_arg_1);
            };
        }

        public function get selected():Boolean
        {
            return (this._selected);
        }

        public function set progress(_arg_1:Number):void
        {
            if (this._progress != _arg_1)
            {
                this._progress = _arg_1;
                if (this._skin)
                {
                    restSkin(_skin);
                };
            };
        }

        override public function get enabled():Boolean
        {
            return (_enabled);
        }

        private function onMouseOut(_arg_1:MouseEvent):void
        {
            if (this._enabled)
            {
                if (this._selected)
                {
                    this.filters = [GamePredef.FILTER_NOALLOW_SELECTED];
                }
                else
                {
                    this.filters = null;
                };
            };
        }

        private function onClick(_arg_1:MouseEvent):void
        {
            if (((this._enabled) && (this._clickFunc)))
            {
                _clickFunc(_arg_1);
            };
        }

        public function set label(_arg_1:String):void
        {
            var _local_2:TextFormat;
            if (!_textField)
            {
                _textField = new TextField();
                _textField.selectable = false;
                _textField.height = this.height;
                _textField.width = this.width;
                _textField.textColor = 0xFFFFFF;
                this.addChild(_textField);
                _local_2 = new TextFormat();
                _local_2.align = "center";
                _textField.setTextFormat(_local_2);
            };
            _textField.text = _arg_1;
        }

        private function restSkin(_arg_1:Class):void
        {
            var _local_8:Number;
            var _local_9:Number;
            var _local_10:Number;
            var _local_11:ColorMatrixFilter;
            var _local_12:Number;
            var _local_13:Rectangle;
            var _local_14:Point;
            _skin = _arg_1;
            var _local_2:DisplayObject = new (_arg_1)();
            var _local_3:Number = 1;
            var _local_4:Number = 1;
            if (this.width)
            {
                _local_3 = (this.width / _local_2.width);
                _local_2.width = this.width;
            };
            if (this.height)
            {
                _local_4 = (this.height / _local_2.height);
                _local_2.height = this.height;
            };
            var _local_5:BitmapData = new BitmapData(_local_2.width, _local_2.height, true, 0);
            var _local_6:Matrix = new Matrix();
            _local_6.scale(_local_3, _local_4);
            _local_5.draw(_local_2, _local_6);
            if (this._progress < 1)
            {
                _local_8 = 0.212671;
                _local_9 = 0.71516;
                _local_10 = 0.072169;
                _local_11 = new ColorMatrixFilter(new Array(_local_8, _local_9, _local_10, 0, 0, _local_8, _local_9, _local_10, 0, 0, _local_8, _local_9, _local_10, 0, 0, 0, 0, 0, 1, 0));
                if (_orient_horizon)
                {
                    _local_12 = (_local_5.width * _progress);
                    _local_13 = new Rectangle(_local_12, 0, _local_2.width, _local_5.height);
                    _local_14 = new Point(_local_12, 0);
                }
                else
                {
                    _local_12 = (_local_5.height * _progress);
                    _local_13 = new Rectangle(0, _local_12, _local_5.width, _local_2.height);
                    _local_14 = new Point(0, _local_12);
                };
                _local_5.applyFilter(_local_5, _local_13, _local_14, _local_11);
            };
            _local_2 = null;
            var _local_7:Bitmap = new Bitmap(_local_5);
            _local_5 = null;
            this.addChildAt(_local_7, 0);
        }

        public function set selected(_arg_1:Boolean):void
        {
            if (_enabled)
            {
                if (this._selected != _arg_1)
                {
                    this._selected = _arg_1;
                    if (!_arg_1)
                    {
                        this.filters = null;
                    }
                    else
                    {
                        this.filters = [GamePredef.FILTER_NOALLOW_SELECTED];
                    };
                };
            };
        }


    }
}//package com.qeedoo.ui.view.comp

