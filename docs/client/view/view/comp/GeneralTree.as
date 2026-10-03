// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.GeneralTree

package com.qeedoo.ui.view.comp
{
    import mx.controls.Tree;
    import mx.controls.listClasses.IListItemRenderer;
    import flash.events.MouseEvent;
    import flash.events.KeyboardEvent;
    import com.qeedoo.ui.event.DressEvent;
    import flash.events.Event;

    public class GeneralTree extends Tree 
    {

        private var _selectAfterUpdate:Boolean;
        protected var _selectItem:Object;
        public var selectFirstLeaf:Boolean = true;
        private var _leafIndex:int = 0;
        private var _dataProviderChanged:Boolean;


        override protected function mouseDownHandler(_arg_1:MouseEvent):void
        {
            var _local_4:Boolean;
            var _local_2:IListItemRenderer = mouseEventToItemRenderer(_arg_1);
            if (_local_2 == null)
            {
                return;
            };
            var _local_3:Object = _local_2.data;
            if (dataDescriptor.isBranch(_local_3))
            {
                _local_4 = isItemOpen(_local_3);
                expandItem(_local_3, (!(_local_4)));
                return;
            };
            super.mouseDownHandler(_arg_1);
        }

        override protected function keyDownHandler(_arg_1:KeyboardEvent):void
        {
        }

        override public function set selectedItem(_arg_1:Object):void
        {
            super.selectedItem = _arg_1;
            _selectItem = this.selectedItem;
            this.dispatchEvent(new DressEvent(DressEvent.TREE_SELECTED));
        }

        override public function expandItem(_arg_1:Object, _arg_2:Boolean, _arg_3:Boolean=false, _arg_4:Boolean=false, _arg_5:Event=null):void
        {
            var _local_7:Object;
            var _local_6:Object = this.openItems;
            for each (_local_7 in _local_6)
            {
                if (itemToUID(_local_7) != itemToUID(_arg_1))
                {
                    super.expandItem(_local_7, false);
                };
            };
            super.expandItem(_arg_1, _arg_2, false, _arg_4, _arg_5);
        }

        override protected function selectItem(_arg_1:IListItemRenderer, _arg_2:Boolean, _arg_3:Boolean, _arg_4:Boolean=true):Boolean
        {
            if (dataDescriptor.isBranch(_arg_1.data))
            {
                return (false);
            };
            _arg_3 = false;
            var _local_5:Boolean = super.selectItem(_arg_1, _arg_2, _arg_3, _arg_4);
            _selectItem = this.selectedItem;
            ((_local_5) && (this.dispatchEvent(new DressEvent(DressEvent.TREE_SELECTED))));
            return (_local_5);
        }

        override public function expandChildrenOf(_arg_1:Object, _arg_2:Boolean):void
        {
            var _local_4:Object;
            var _local_3:Object = this.openItems;
            for each (_local_4 in _local_3)
            {
                if (itemToUID(_local_4) != itemToUID(_arg_1))
                {
                    super.expandChildrenOf(_local_4, false);
                };
            };
            super.expandChildrenOf(_arg_1, _arg_2);
        }

        override public function set dataProvider(_arg_1:Object):void
        {
            _dataProviderChanged = true;
            super.dataProvider = _arg_1;
            ((selectFirstLeaf) && (showFirstLeaf()));
        }

        override protected function updateDisplayList(_arg_1:Number, _arg_2:Number):void
        {
            var _local_3:IListItemRenderer;
            super.updateDisplayList(_arg_1, _arg_2);
            if (_selectAfterUpdate)
            {
                showFirstLeaf();
                return;
            };
            _leafIndex = 0;
            if (_selectItem)
            {
                _local_3 = itemToItemRenderer(_selectItem);
                if (((_local_3) && (!(_local_3 == itemToItemRenderer(selectedItem)))))
                {
                    selectItem(_local_3, false, false);
                };
            };
        }

        protected function showFirstLeaf():void
        {
            _selectAfterUpdate = false;
            if (_dataProviderChanged)
            {
                _selectAfterUpdate = true;
                return;
            };
            var _local_1:IListItemRenderer = indexToItemRenderer(_leafIndex);
            if (_local_1 == null)
            {
                _selectAfterUpdate = true;
                return;
            };
            if (dataDescriptor.isBranch(_local_1.data))
            {
                _leafIndex++;
                _selectAfterUpdate = true;
                this.openItems = [_local_1.data];
                return;
            };
            var _local_2:Boolean = selectItem(_local_1, false, false);
            _selectAfterUpdate = (!(_local_2));
            if (!_selectAfterUpdate)
            {
                _leafIndex = 0;
            };
        }

        override protected function commitProperties():void
        {
            super.commitProperties();
            _dataProviderChanged = false;
        }


    }
}//package com.qeedoo.ui.view.comp

