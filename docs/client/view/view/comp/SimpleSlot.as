// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.SimpleSlot

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.controls.Image;
    import flash.text.TextField;
    import com.qeedoo.game.system.Core;
    import mx.core.UIComponent;
    import flash.text.TextFormat;
    import flash.text.TextFormatAlign;
    import com.qeedoo.game.predef.GamePredef;
    import flash.events.MouseEvent;
    import com.qeedoo.game.data.GameData;
    import mx.utils.ObjectUtil;
    import com.qeedoo.ui.resource.ResManager;
    import flash.utils.setTimeout;
    import flash.events.Event;
    import flash.utils.clearTimeout;
    import com.qeedoo.game.view.ViewManager;

    public class SimpleSlot extends Canvas 
    {

        private static const LENGTH:int = 34;
        private static const STACK_MAX:int = 9999;
        private static const SHOW_DELAY:Number = 180;

        public var type:int;
        private var _tipTimer:Number;
        private var _slotId:Number;
        private var _image:Image;
        private var _toolTip:Object;
        private var _stackTxt:TextField;
        private var _slotType:int = 0;
        private var _stackNum:Number;
        private var _core:Core = Core.getInstance();

        public function SimpleSlot()
        {
            this.styleName = "TransparentSlot";
            this.verticalScrollPolicy = "off";
            this.horizontalScrollPolicy = "off";
            this.width = (this.height = LENGTH);
            _image = new Image();
            _image.setStyle("verticalCenter", 0);
            _image.setStyle("horizontalCenter", 0);
            this.addChild(_image);
            var _local_1:UIComponent = new UIComponent();
            _local_1.width = (_local_1.height = LENGTH);
            _local_1.mouseEnabled = false;
            _local_1.mouseChildren = false;
            this.addChild(_local_1);
            _stackTxt = new TextField();
            _stackTxt.y = 20;
            _stackTxt.height = 13;
            _stackTxt.width = LENGTH;
            _stackTxt.selectable = false;
            _stackTxt.mouseEnabled = false;
            _stackTxt.mouseWheelEnabled = false;
            var _local_2:TextFormat = new TextFormat("Arial", 8, 0xFFFFFF);
            _local_2.align = TextFormatAlign.RIGHT;
            _stackTxt.defaultTextFormat = _local_2;
            _stackTxt.filters = [GamePredef.FILTER_SHADOW_TEXT, GamePredef.FILTER_SHADOW_TEXT2];
            _local_1.addChild(_stackTxt);
            this.addEventListener(MouseEvent.ROLL_OVER, overHandler);
            this.addEventListener(MouseEvent.ROLL_OUT, outHandler);
        }

        public function set stackNum(_arg_1:Number):void
        {
            if (_stackNum == _arg_1)
            {
                return;
            };
            caculateAmount(_arg_1);
        }

        private function showTooltip():void
        {
            if (((!(type == GamePredef.TBL_ITEM_TEMPLATE)) || (!(_core.data.hasData(type, _slotId)))))
            {
                return;
            };
            var _local_1:Object = GameData.d[type][_slotId];
            var _local_2:Object = {};
            _local_2.slotType = _slotType;
            _local_2.type = BasicToolTip.TYPE_TEMP;
            _local_2.btnVisible = false;
            _local_2.soulActived = false;
            _local_2.inst = null;
            _local_2.temp = ObjectUtil.copy(_local_1);
            _toolTip = getToolTip();
            _toolTip.object = _local_2;
            if (((type == GamePredef.TBL_ITEM_TEMPLATE) || (type == GamePredef.TBL_EQUIPT_TEMPLATE)))
            {
                _toolTip.currencyHide("temp");
            };
            _toolTip.show();
        }

        private function updateView():void
        {
            if (((!(_slotId)) || (!(_core.data.hasData(type, _slotId)))))
            {
                this.clean();
                return;
            };
            var _local_1:Object = GameData.d[type][_slotId];
            _image.source = ((_local_1.iconCode) ? ResManager.getIconUrl(_local_1.iconCode) : null);
            ResManager.setColorCode(_image, _local_1.colorCode);
            caculateAmount();
        }

        public function clean():void
        {
            _stackNum = 0;
            _slotId = null;
            _stackTxt.text = "0";
            _image.source = null;
        }

        private function overHandler(_arg_1:Event):void
        {
            _arg_1.stopImmediatePropagation();
            this.filters = [GamePredef.FILTER_SLOT_SELECTED];
            if (((type > 0) && (slotId > 0)))
            {
                _tipTimer = setTimeout(showTooltip, SHOW_DELAY);
            };
        }

        private function outHandler(_arg_1:Event):void
        {
            _arg_1.stopImmediatePropagation();
            this.filters = null;
            clearTimeout(_tipTimer);
            ((_toolTip) && (_toolTip.hide()));
        }

        private function getToolTip():Object
        {
            return (_core.view.getUI(ViewManager.TOOLTIP_ITEM));
        }

        public function set slotId(_arg_1:Number):void
        {
            _slotId = _arg_1;
            this.updateView();
        }

        protected function caculateAmount(_arg_1:Number=-1):void
        {
            _stackNum = ((_arg_1 >= 0) ? _arg_1 : _core.getItemNumFromBag(type, slotId).num);
            if (_stackNum < 0)
            {
                _stackNum = 0;
            };
            var _local_2:String = ((_stackNum > STACK_MAX) ? (STACK_MAX + "+") : String(_stackNum));
            _stackTxt.text = _local_2;
        }

        public function get slotId():Number
        {
            return (_slotId);
        }


    }
}//package com.qeedoo.ui.view.comp

