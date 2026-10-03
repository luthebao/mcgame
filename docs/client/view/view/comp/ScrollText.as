// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.ScrollText

package com.qeedoo.ui.view.comp
{
    import flash.display.Sprite;
    import flash.text.TextField;
    import com.qeedoo.effects.EnterFrameMove;
    import flash.text.TextFieldType;
    import flash.text.TextFieldAutoSize;
    import com.qeedoo.game.predef.GamePredef;
    import flash.events.Event;
    import flash.text.TextFormat;

    public class ScrollText extends Sprite 
    {

        private var _initY:int;
        private var _initX:int;
        private var _textField:TextField;
        private var _gameObjMove:EnterFrameMove;

        public function ScrollText()
        {
            _textField = new TextField();
            _textField.type = TextFieldType.DYNAMIC;
            _textField.background = false;
            _textField.selectable = false;
            _textField.autoSize = TextFieldAutoSize.CENTER;
            _textField.filters = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
            _gameObjMove = new EnterFrameMove();
            _gameObjMove.target = _textField;
        }

        private function moveEndHandler(_arg_1:Event):void
        {
            _gameObjMove.removeEventListener(EnterFrameMove.EFFECT_END, moveEndHandler);
            removeChild(_textField);
            reset();
        }

        public function freeShow(_arg_1:String, _arg_2:uint=0xFF0000, _arg_3:int=32, _arg_4:int=2, _arg_5:int=20):void
        {
            if (((!(_arg_1)) || (_arg_1.length == 0)))
            {
                return;
            };
            var _local_6:TextFormat = new TextFormat("黑体", _arg_3, _arg_2, true);
            if (Number(_arg_1))
            {
                _local_6.font = "GameNumber";
                _textField.embedFonts = true;
            }
            else
            {
                _textField.embedFonts = false;
            };
            _textField.text = _arg_1;
            _textField.setTextFormat(_local_6);
            _textField.y = 0;
            _textField.x = (-(_textField.width) / 2);
            addChild(_textField);
            _gameObjMove.yBy = -(_arg_5);
            _gameObjMove.xBy = 0;
            _gameObjMove.target = _textField;
            _gameObjMove.stepLength = _arg_4;
            _gameObjMove.play();
            _gameObjMove.addEventListener(EnterFrameMove.EFFECT_END, moveEndHandler);
        }

        private function reset():void
        {
            var _local_1:TextFormat = new TextFormat("黑体", 32, 0xFF0000, true);
            _textField.text = "";
            _textField.setTextFormat(_local_1);
        }

        public function destroy():void
        {
            _textField = null;
            _gameObjMove.removeEventListener(EnterFrameMove.EFFECT_END, moveEndHandler);
            _gameObjMove.destroy();
            _gameObjMove = null;
            if (parent)
            {
                parent.removeChild(this);
            };
        }

        public function show(_arg_1:String, _arg_2:uint=0xFF0000, _arg_3:int=32, _arg_4:int=2, _arg_5:int=20):void
        {
            if (((!(_arg_1)) || (_arg_1.length == 0)))
            {
                return;
            };
            var _local_6:TextFormat = new TextFormat("黑体", _arg_3, _arg_2, true);
            if (Number(_arg_1))
            {
                _local_6.font = "GameNumber";
                _textField.embedFonts = true;
            }
            else
            {
                _local_6.size = 18;
                _textField.embedFonts = false;
            };
            _textField.text = _arg_1;
            _textField.setTextFormat(_local_6);
            _textField.y = 0;
            _textField.x = (-(_textField.width) / 2);
            addChild(_textField);
            _gameObjMove.yBy = -(_arg_5);
            _gameObjMove.xBy = 0;
            _gameObjMove.target = _textField;
            _gameObjMove.stepLength = _arg_4;
            _gameObjMove.play();
            _gameObjMove.addEventListener(EnterFrameMove.EFFECT_END, moveEndHandler);
        }


    }
}//package com.qeedoo.ui.view.comp

