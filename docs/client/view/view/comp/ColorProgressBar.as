// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.ColorProgressBar

package com.qeedoo.ui.view.comp
{
    import mx.core.UIComponent;
    import flash.text.TextField;
    import flash.display.Shape;
    import flash.text.TextFormat;
    import flash.text.TextFormatAlign;
    import com.qeedoo.game.predef.GamePredef;

    public class ColorProgressBar extends UIComponent 
    {

        private const UP_OFFSET:Number = 0.5;

        private var _downColorChanged:Boolean;
        private var _height:Number = 15;
        private var _width:Number = 100;
        private var _progressChanged:Boolean;
        private var _upColor:uint = 0xFF0000;
        private var _textField:TextField;
        private var _fontSize:int = 12;
        private var _fontColor:uint = 0xFFFFFF;
        private var _maskShape:Shape;
        private var _title:String;
        private var _titleChanged:Boolean;
        private var _upShape:Shape;
        private var _downShape:Shape;
        private var _maximum:uint = 100;
        private var _downColor:uint = 0;
        private var _upColorChanged:Boolean;
        private var _value:uint = 0;

        public function ColorProgressBar()
        {
            _upShape = new Shape();
            _downShape = new Shape();
            _maskShape = new Shape();
            this.addChild(_downShape);
            this.addChild(_upShape);
            this.addChild(_maskShape);
            _upShape.x = UP_OFFSET;
            _upShape.y = UP_OFFSET;
            _upShape.mask = _maskShape;
            _maskShape.visible = true;
            _upColorChanged = true;
            _downColorChanged = true;
            _progressChanged = true;
        }

        public function set downColor(_arg_1:uint):void
        {
            if (_upColor == _arg_1)
            {
                return;
            };
            _downColor = _arg_1;
            _downColorChanged = true;
            invalidateDisplayList();
        }

        override public function set width(_arg_1:Number):void
        {
            if ((((isNaN(_width)) || (_width <= 0)) || (_width == _arg_1)))
            {
                return;
            };
            _width = _arg_1;
            _upColorChanged = true;
            _downColorChanged = true;
            invalidateDisplayList();
        }

        public function set upColor(_arg_1:uint):void
        {
            if (_downColor == _arg_1)
            {
                return;
            };
            _upColor = _arg_1;
            _upColorChanged = true;
            invalidateDisplayList();
        }

        public function get maximum():Number
        {
            return (_maximum);
        }

        public function setProgress(_arg_1:uint, _arg_2:uint):void
        {
            if (((isNaN(_arg_1)) || (isNaN(_arg_2))))
            {
                return;
            };
            if (_arg_1 > _arg_2)
            {
                (_arg_1 == _arg_2);
            };
            if (((_value == _arg_1) && (_maximum == _arg_2)))
            {
                return;
            };
            _value = _arg_1;
            _maximum = _arg_2;
            _progressChanged = true;
            _titleChanged = true;
            invalidateDisplayList();
        }

        public function set title(_arg_1:String):void
        {
            if (_title == _arg_1)
            {
                return;
            };
            _title = _arg_1;
            _titleChanged = true;
            invalidateDisplayList();
        }

        public function get value():Number
        {
            return (_value);
        }

        override public function set height(_arg_1:Number):void
        {
            if ((((isNaN(_height)) || (_height <= 0)) || (_height == _arg_1)))
            {
                return;
            };
            _height = _arg_1;
            _upColorChanged = true;
            _downColorChanged = true;
            invalidateDisplayList();
        }

        private function createTitle():void
        {
            if (_textField)
            {
                return;
            };
            _textField = new TextField();
            _textField.selectable = false;
            _textField.mouseEnabled = false;
            _textField.mouseWheelEnabled = false;
            var _local_1:TextFormat = new TextFormat("宋体", _fontSize, _fontColor);
            _local_1.align = TextFormatAlign.CENTER;
            _textField.defaultTextFormat = _local_1;
            _textField.filters = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
            this.addChild(_textField);
        }

        override protected function updateDisplayList(_arg_1:Number, _arg_2:Number):void
        {
            super.updateDisplayList(_arg_1, _arg_2);
            if (_upColorChanged)
            {
                _upShape.graphics.clear();
                _upShape.graphics.beginFill(_upColor);
                _upShape.graphics.drawRect(0, 0, (_width - (2 * UP_OFFSET)), (_height - (2 * UP_OFFSET)));
                _upShape.graphics.endFill();
                _upColorChanged = false;
            };
            if (_downColorChanged)
            {
                _downShape.graphics.clear();
                _downShape.graphics.beginFill(_downColor);
                _downShape.graphics.drawRect(0, 0, _width, _height);
                _upShape.graphics.endFill();
                _downColorChanged = false;
            };
            if (_progressChanged)
            {
                _maskShape.graphics.clear();
                _maskShape.graphics.beginFill(0xFFFF00);
                _maskShape.graphics.drawRect(0, 0, ((_width * _value) / _maximum), _height);
                _maskShape.graphics.endFill();
                _progressChanged = false;
            };
            if (_titleChanged)
            {
                this.createTitle();
                _textField.width = _width;
                _textField.height = _height;
                _textField.text = (((_title + _value) + "/") + _maximum);
                _titleChanged = false;
            };
        }


    }
}//package com.qeedoo.ui.view.comp

