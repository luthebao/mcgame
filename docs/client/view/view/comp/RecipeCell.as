// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.RecipeCell

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
    import mx.events.DragEvent;
    import com.qeedoo.ui.event.DressEvent;
    import com.qeedoo.game.data.GameData;
    import com.qeedoo.ui.resource.ResManager;
    import flash.events.Event;
    import mx.managers.PopUpManager;
    import com.qeedoo.game.view.ViewManager;
    import mx.core.Application;
    import flash.display.DisplayObject;
    import mx.managers.DragManager;
    import mx.core.IUIComponent;
    import mx.core.DragSource;
    import com.adobe.serialization.json.JSON;

    public class RecipeCell extends Canvas 
    {

        private static const LENGTH:int = 34;
        private static const STACK_MAX:int = 9999;

        private var _iconImg:Image;
        private var _tooltip:TipRecipe;
        public var acceptable:Boolean;
        public var inPopUp:Boolean;
        private var _recipeId:Number;
        private var _stackTxt:TextField;
        private var _stackNum:Number;
        private var _core:Core = Core.getInstance();

        public function RecipeCell()
        {
            this.styleName = "TransparentSlot";
            this.verticalScrollPolicy = "off";
            this.horizontalScrollPolicy = "off";
            this.width = (this.height = LENGTH);
            _iconImg = new Image();
            _iconImg.setStyle("verticalCenter", 0);
            _iconImg.setStyle("horizontalCenter", 0);
            this.addChild(_iconImg);
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
            this.addEventListener(MouseEvent.CLICK, clickHandler);
            this.addEventListener(DragEvent.DRAG_ENTER, dragEnterHandler);
            this.addEventListener(DragEvent.DRAG_DROP, dragDropHandler);
        }

        private function dragDropHandler(_arg_1:DragEvent):void
        {
            if (!_arg_1.dragSource.hasFormat("RecipeCell"))
            {
                return;
            };
            var _local_2:RecipeCell = (_arg_1.dragSource.dataForFormat("RecipeCell") as RecipeCell);
            if (((!(_local_2)) || (_local_2 == this)))
            {
                return;
            };
            var _local_3:Number = _local_2.recipeId;
            this.recipeId = _local_3;
            this.dispatchEvent(new DressEvent(DressEvent.DRESS_DROP));
        }

        public function get recipeId():Number
        {
            return (_recipeId);
        }

        private function updateView():void
        {
            if (!_recipeId)
            {
                this.clean();
                return;
            };
            var _local_1:Object = GameData.d[GamePredef.TBL_RECIPE][_recipeId];
            if (!_local_1)
            {
                this.clean();
                return;
            };
            _iconImg.source = ResManager.getIconUrl(_local_1.iconCode);
            caculateAmount();
        }

        public function set recipeId(_arg_1:Number):void
        {
            _recipeId = _arg_1;
            this.updateView();
        }

        private function overHandler(_arg_1:Event):void
        {
            _arg_1.stopImmediatePropagation();
            filters = [GamePredef.FILTER_SLOT_SELECTED];
            showHideTooltip(false);
        }

        public function clean():void
        {
            _stackNum = 0;
            _recipeId = null;
            _stackTxt.text = "";
            _iconImg.source = null;
        }

        private function outHandler(_arg_1:Event):void
        {
            _arg_1.stopImmediatePropagation();
            filters = null;
            showHideTooltip(true);
        }

        private function showHideTooltip(_arg_1:Boolean):void
        {
            var _local_2:UIBase;
            if (_arg_1)
            {
                ((_tooltip) && (_tooltip.hide()));
                if (((inPopUp) && (_tooltip)))
                {
                    PopUpManager.removePopUp(_tooltip);
                    ((_tooltip.parent) && (_tooltip.parent.removeChild(_tooltip)));
                    _local_2 = (_core.view.getUI(ViewManager.UI_TOOLTIP) as UIBase);
                    _local_2.addChild(_tooltip);
                };
                _tooltip = null;
                return;
            };
            if (!_recipeId)
            {
                return;
            };
            _tooltip = (_core.view.getUI(ViewManager.TOOLTIP_RECIPE) as TipRecipe);
            _tooltip.recipeId = _recipeId;
            _tooltip.show();
            if (inPopUp)
            {
                ((_tooltip.parent) && (_tooltip.parent.removeChild(_tooltip)));
                PopUpManager.addPopUp(_tooltip, (Application.application as DisplayObject));
            };
        }

        private function dragEnterHandler(_arg_1:DragEvent):void
        {
            (((acceptable) && (_arg_1.dragSource.hasFormat("RecipeCell"))) && (DragManager.acceptDragDrop((_arg_1.currentTarget as IUIComponent))));
        }

        private function clickHandler(_arg_1:MouseEvent):void
        {
            var _local_3:Image;
            _arg_1.stopImmediatePropagation();
            if (!_recipeId)
            {
                return;
            };
            showHideTooltip(true);
            var _local_2:DragSource = new DragSource();
            _local_2.addData(this, "RecipeCell");
            _local_3 = new Image();
            _local_3.source = _iconImg.source;
            _local_3.height = _iconImg.height;
            _local_3.width = _iconImg.width;
            _local_3.x = _iconImg.x;
            _local_3.y = _iconImg.y;
            DragManager.doDrag(_iconImg, _local_2, _arg_1, _local_3, 0, 0, 0.5);
        }

        protected function caculateAmount():void
        {
            var _local_1:String;
            var _local_2:Object;
            var _local_3:Object;
            var _local_4:Number;
            var _local_5:String;
            if (_stackNum)
            {
                if (_stackNum < 0)
                {
                    _stackTxt.text = "";
                    return;
                };
                _local_1 = ((_stackNum > STACK_MAX) ? (STACK_MAX + "+") : String(_stackNum));
                _stackTxt.text = _local_1;
                return;
            };
            if (_core.player.dressInfo)
            {
                _local_2 = com.adobe.serialization.json.JSON.decode(_core.player.dressInfo);
                if (((_local_2) && (_local_2.recipe)))
                {
                    _local_3 = _local_2.recipe;
                    if (_local_3[_recipeId])
                    {
                        _local_4 = Number(_local_3[_recipeId]);
                        _local_5 = ((_local_4 > STACK_MAX) ? (STACK_MAX + "+") : _local_3[_recipeId]);
                        _stackTxt.text = _local_5;
                        return;
                    };
                };
            };
            _stackTxt.text = "";
        }

        public function set stackNum(_arg_1:Number):void
        {
            if (_stackNum == _arg_1)
            {
                return;
            };
            _stackNum = _arg_1;
            caculateAmount();
        }


    }
}//package com.qeedoo.ui.view.comp

