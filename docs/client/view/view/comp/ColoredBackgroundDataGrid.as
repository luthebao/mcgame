// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.ColoredBackgroundDataGrid

package com.qeedoo.ui.view.comp
{
    import mx.controls.DataGrid;
    import mx.collections.ArrayCollection;
    import flash.display.Sprite;
    import flash.display.Shape;
    import mx.controls.dataGridClasses.DataGridColumn;

    public class ColoredBackgroundDataGrid extends DataGrid 
    {

        public var rowColorFunction:Function;
        public var columnBackgroundAlpha:Number = 1;
        public var columnBackgroundFunction:Function;


        override protected function drawRowBackground(_arg_1:Sprite, _arg_2:int, _arg_3:Number, _arg_4:Number, _arg_5:uint, _arg_6:int):void
        {
            var _local_7:ArrayCollection;
            var _local_8:Object;
            if (((!(rowColorFunction == null)) && (!(dataProvider == null))))
            {
                _local_7 = (dataProvider as ArrayCollection);
                if (_arg_6 < _local_7.length)
                {
                    _local_8 = _local_7.getItemAt(_arg_6);
                };
                _arg_5 = rowColorFunction(_local_8, _arg_2, _arg_6, _arg_5);
            };
            super.drawRowBackground(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6);
        }

        override protected function drawColumnBackground(_arg_1:Sprite, _arg_2:int, _arg_3:uint, _arg_4:DataGridColumn):void
        {
            var _local_6:Shape;
            var _local_7:Object;
            var _local_8:Number;
            var _local_9:Number;
            var _local_10:Number;
            var _local_11:Number;
            super.drawColumnBackground(_arg_1, _arg_2, _arg_3, _arg_4);
            var _local_5:Shape = Shape(_arg_1.getChildByName(_arg_2.toString()));
            if (_local_5)
            {
                _local_5.alpha = columnBackgroundAlpha;
            };
            if (columnBackgroundFunction != null)
            {
                _local_6 = Shape(_arg_1.getChildByName(("lines" + _arg_2.toString())));
                if (_local_6 == null)
                {
                    _local_6 = new Shape();
                    _local_6.name = ("lines" + _arg_2);
                    _arg_1.addChild(_local_6);
                };
                _local_7 = rowInfo[(listItems.length - 1)];
                _local_8 = listItems[0][_arg_2].x;
                _local_9 = rowInfo[0].y;
                _local_10 = listItems[0][_arg_2].width;
                if (this.headerHeight > 0)
                {
                    _local_9 = (_local_9 + rowInfo[0].height);
                };
                _local_11 = Math.min((_local_7.y + _local_7.height), (listContent.height - _local_9));
                columnBackgroundFunction(_arg_4, _arg_2, _local_6, _local_8, _local_9, _local_10, _local_11);
            };
        }


    }
}//package com.qeedoo.ui.view.comp

