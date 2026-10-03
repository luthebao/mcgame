// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.CustomMenu

package com.qeedoo.ui.view.comp
{
    import mx.controls.Menu;
    import mx.controls.Label;
    import flash.filters.GlowFilter;
    import flash.display.DisplayObjectContainer;
    import mx.core.Application;
    import flash.display.Sprite;
    import flash.display.Graphics;
    import mx.controls.listClasses.IListItemRenderer;

    public class CustomMenu extends Menu 
    {

        public static var alpha:Number = 0.9;

        private var preLabel:Label;
        private var glowFilter:GlowFilter;


        public static function createMenu(_arg_1:DisplayObjectContainer, _arg_2:Object, _arg_3:Boolean=true):Menu
        {
            var _local_4:CustomMenu = new (CustomMenu)();
            _local_4.tabEnabled = false;
            _local_4.owner = DisplayObjectContainer(Application.application);
            _local_4.showRoot = _arg_3;
            Menu.popUpMenu(_local_4, _arg_1, _arg_2);
            return (_local_4);
        }


        override protected function drawHighlightIndicator(_arg_1:Sprite, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Number, _arg_6:uint, _arg_7:IListItemRenderer):void
        {
            var _local_8:Number = 7177882;
            var _local_9:Number = 1520453;
            var _local_10:Number = 1;
            var _local_11:Graphics = Sprite(_arg_1).graphics;
            _local_11.clear();
            _local_11.beginFill(_local_8, alpha);
            _local_11.drawRect((0 - _local_10), 0, (_arg_4 + _local_10), _arg_5);
            _local_11.endFill();
            _local_11.beginFill(_local_9, alpha);
            _local_11.drawRect((1 - _local_10), 1, ((_arg_4 + _local_10) - 2), (_arg_5 - 2));
            _local_11.endFill();
            _arg_1.x = _arg_2;
            _arg_1.y = _arg_3;
        }


    }
}//package com.qeedoo.ui.view.comp

