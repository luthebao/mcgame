// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.PropBar

package com.qeedoo.ui.view.comp
{
    import flash.display.Sprite;
    import flash.text.TextField;
    import flash.text.TextFieldType;
    import flash.text.TextFieldAutoSize;

    public class PropBar extends Sprite 
    {

        private var _height:Number = 4;
        private var _width:Number = 50;
        private var _text:TextField;
        private var _valueMax:Number = 200;
        private var _frontColor:uint = 7527271;
        private var _borderColor:uint = 0xDDDDDD;
        private var _showTip:Boolean = false;
        private var _tipColor:uint = 0;
        private var _propName:String = "Prop";
        private var _radius:int = 2;
        private var _value:Number = 50;
        private var _backColor:uint = 0x333333;

        public function PropBar()
        {
            _text = new TextField();
            _text.type = TextFieldType.DYNAMIC;
            _text.background = false;
            _text.selectable = false;
            _text.autoSize = TextFieldAutoSize.CENTER;
        }

        public function get valueMax():Number
        {
            return (_valueMax);
        }

        public function set barWidth(_arg_1:Number):void
        {
            _width = _arg_1;
            update();
        }

        public function update():void
        {
            graphics.clear();
            drawBorder();
            graphics.lineStyle();
            graphics.beginFill(_backColor);
            graphics.drawRoundRect(0, 0, _width, _height, _radius, _radius);
            graphics.endFill();
            graphics.lineStyle();
            graphics.beginFill(_frontColor);
            graphics.drawRoundRect(0, 0, Math.round((_width * (_value / _valueMax))), _height, _radius, _radius);
            graphics.endFill();
            if (_showTip)
            {
                _text.text = ((((_propName + ":") + _value.toString()) + "/") + _valueMax.toString());
                _text.x = ((_width - _text.width) / 2);
                _text.height = _text.textHeight;
                _text.textColor = _tipColor;
                addChild(_text);
            };
        }

        private function drawBorder():void
        {
            graphics.lineStyle(1, 0);
            graphics.beginFill(_borderColor);
            graphics.drawRoundRect(-1, -2, (_width + 2), (_height + 3), _radius, _radius);
            graphics.endFill();
        }

        public function set radius(_arg_1:Number):void
        {
            _radius = _arg_1;
            update();
        }

        public function set tipColor(_arg_1:uint):void
        {
            _tipColor = _arg_1;
            update();
        }

        public function set propName(_arg_1:String):void
        {
            _propName = _arg_1;
            update();
        }

        public function set value(_arg_1:Number):void
        {
            _value = _arg_1;
            if (_value > _valueMax)
            {
                _value = _valueMax;
            };
            if (((_value < 0) || (!(_value))))
            {
                _value = 0;
            };
            update();
        }

        public function set barHeight(_arg_1:Number):void
        {
            _height = _arg_1;
            update();
        }

        public function set valueMax(_arg_1:Number):void
        {
            _valueMax = _arg_1;
            if (_valueMax <= 0)
            {
                _valueMax = 1;
            };
            update();
        }

        public function get value():Number
        {
            return (_value);
        }

        public function set frontColor(_arg_1:uint):void
        {
            _frontColor = _arg_1;
            update();
        }

        public function set showTip(_arg_1:Boolean):void
        {
            _showTip = _arg_1;
            update();
        }

        public function set backColor(_arg_1:uint):void
        {
            _backColor = _arg_1;
            update();
        }


    }
}//package com.qeedoo.ui.view.comp

