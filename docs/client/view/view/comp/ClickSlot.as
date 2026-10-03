// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.ClickSlot

package com.qeedoo.ui.view.comp
{
    import flash.display.Sprite;
    import style.Assets;
    import mx.events.DragEvent;
    import flash.events.MouseEvent;

    public class ClickSlot extends Slot 
    {

        private var _selectImg:Sprite;
        public var clickCall:Function;

        public function ClickSlot()
        {
            this.movable = false;
            this.acceptable = false;
            this.styleName = "TransparentSlot";
            _selectImg = (new Assets.SELECTED_IMG() as Sprite);
            _selectImg.visible = false;
            _selectImg.x = ((this.width - _selectImg.width) >> 1);
            _selectImg.y = ((this.height - _selectImg.height) >> 1);
            this.addToContainer(_selectImg);
        }

        override public function clean():void
        {
            super.clean();
            _selectImg.visible = false;
        }

        override public function set selected(_arg_1:Boolean):void
        {
            _selectImg.visible = _arg_1;
        }

        override public function dragDropHandler(_arg_1:DragEvent):void
        {
        }

        override protected function onClick(_arg_1:MouseEvent):void
        {
            this.hideTooltip();
            if (!this.slotData)
            {
                return;
            };
            _selectImg.visible = (!(_selectImg.visible));
            ((clickCall) && (clickCall(this)));
        }

        public function fakeClick():void
        {
            onClick(null);
        }

        override public function get selected():Boolean
        {
            return (_selectImg.visible);
        }


    }
}//package com.qeedoo.ui.view.comp

