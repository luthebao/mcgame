// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.HButtonTab

package com.qeedoo.ui.view.comp
{
    import mx.containers.HBox;
    import flash.events.MouseEvent;
    import com.qeedoo.ui.event.DressEvent;
    import mx.events.PropertyChangeEvent;

    public class HButtonTab extends HBox 
    {

        private var _filter:Array;
        private var _styleName:Object = "HorizontalTab";
        private var _tabWidth:Number = 60;
        private var _indexChanged:Boolean;
        private var _styleChanged:Boolean;
        private var _filterChanged:Boolean;
        private var _dataChanged:Boolean;
        private var _tabHeight:Number = 20;
        private var _tabHeightChange:Boolean;
        private var _tabWidthChange:Boolean;
        private var _selectedIndex:int = 0;

        private var _dataArray:Array = [];
        private var _instanceArray:Array = [];

        public function HButtonTab()
        {
            this.setStyle("horizontalGap", 0);
        }

        override protected function commitProperties():void
        {
            var _local_1:int;
            var _local_2:int;
            var _local_3:Object;
            var _local_4:int;
            var _local_5:int;
            var _local_6:FilterButton;
            var _local_7:int;
            var _local_8:int;
            var _local_9:FilterButton;
            super.commitProperties();
            if (_dataChanged)
            {
                _local_1 = 0;
                if (((_dataArray) && (_dataArray.length > 0)))
                {
                    _local_1 = _dataArray.length;
                    _local_2 = 0;
                    while (_local_2 < _local_1)
                    {
                        _local_3 = _dataArray[_local_2];
                        _instanceArray[_local_2] = ((_instanceArray[_local_2]) || (new FilterButton()));
                        _instanceArray[_local_2].name = _local_2;
                        _instanceArray[_local_2].width = _tabWidth;
                        _instanceArray[_local_2].height = _tabHeight;
                        _instanceArray[_local_2].label = _dataArray[_local_2];
                        _instanceArray[_local_2].styleName = _styleName;
                        _instanceArray[_local_2].selected = (_local_2 == _selectedIndex);
                        ((!(_instanceArray[_local_2].parent)) && (this.addChild(_instanceArray[_local_2])));
                        _instanceArray[_local_2].addEventListener(MouseEvent.CLICK, changeHandler);
                        _local_2++;
                    };
                };
                if (((_instanceArray) && (_instanceArray.length > _local_1)))
                {
                    _local_4 = _instanceArray.length;
                    _local_5 = _local_1;
                    while (_local_5 < _local_4)
                    {
                        _local_6 = (_instanceArray[_local_5] as FilterButton);
                        if (_local_6)
                        {
                            _local_6.removeEventListener(MouseEvent.CLICK, changeHandler);
                            ((_local_6.parent) && (_local_6.parent.removeChild(_local_6)));
                            _local_6 = null;
                        };
                        _local_5++;
                    };
                    _instanceArray.length = _local_1;
                };
                illegalInspection();
            };
            if (((!(_instanceArray)) || (_instanceArray.length <= 0)))
            {
                return;
            };
            ((_indexChanged) && (illegalInspection()));
            if ((((((_styleChanged) || (_indexChanged)) || (_filterChanged)) || (_tabWidthChange)) || (_tabHeightChange)))
            {
                _local_7 = _instanceArray.length;
                _local_8 = 0;
                while (_local_8 < _local_7)
                {
                    _local_9 = (_instanceArray[_local_8] as FilterButton);
                    if (_local_9)
                    {
                        if (_indexChanged)
                        {
                            _local_9.selected = (_local_8 == _selectedIndex);
                        };
                        if (_styleChanged)
                        {
                            _local_9.styleName = _styleName;
                        };
                        if (_filterChanged)
                        {
                            _local_9.filters = _filter;
                        };
                        if (_tabWidthChange)
                        {
                            _local_9.width = _tabWidth;
                        };
                        if (_tabHeightChange)
                        {
                            _local_9.height = _tabHeight;
                        };
                    };
                    _local_8++;
                };
                _indexChanged = false;
                _styleChanged = false;
                _filterChanged = false;
                _tabWidthChange = false;
                _tabHeightChange = false;
            };
        }

        private function changeHandler(_arg_1:MouseEvent):void
        {
            _arg_1.stopImmediatePropagation();
            var _local_2:FilterButton = (_arg_1.currentTarget as FilterButton);
            if (!_local_2)
            {
                return;
            };
            var _local_3:int = int(_local_2.name);
            this.selectedIndex = _local_3;
        }

        private function illegalInspection():void
        {
            var _local_1:int = ((_dataArray) ? _dataArray.length : 0);
            if ((_selectedIndex > _local_1))
            {
                this.selectedIndex = 0;
            };
        }

        private function set _1436069623selectedIndex(_arg_1:int):void
        {
            if (_selectedIndex == _arg_1)
            {
                return;
            };
            _selectedIndex = _arg_1;
            _indexChanged = true;
            invalidateProperties();
            if (this.willTrigger(DressEvent.TAB_CHANGED))
            {
                this.dispatchEvent(new DressEvent(DressEvent.TAB_CHANGED));
            };
        }

        public function set dataArray(_arg_1:Array):void
        {
            if (_dataArray == _arg_1)
            {
                return;
            };
            _dataArray = _arg_1;
            _dataChanged = true;
        }

        override public function get styleName():Object
        {
            return (_styleName);
        }

        public function set tabHeight(_arg_1:Number):void
        {
            if (_tabHeight == _arg_1)
            {
                return;
            };
            _tabHeight = _arg_1;
            _tabHeightChange = true;
        }

        public function set tabWidth(_arg_1:Number):void
        {
            if (_tabWidth == _arg_1)
            {
                return;
            };
            _tabWidth = _arg_1;
            _tabWidthChange = true;
        }

        [Bindable(event="propertyChange")]
        public function set selectedIndex(_arg_1:int):void
        {
            var _local_2:Object = this.selectedIndex;
            if (_local_2 !== _arg_1)
            {
                this._1436069623selectedIndex = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "selectedIndex", _local_2, _arg_1));
            };
        }

        override public function set filters(_arg_1:Array):void
        {
            if (_filter == _arg_1)
            {
                return;
            };
            _filter = _arg_1;
            _filterChanged = true;
        }

        public function get selectedIndex():int
        {
            return (_selectedIndex);
        }

        override public function get filters():Array
        {
            return (_filter);
        }

        override public function set styleName(_arg_1:Object):void
        {
            if (_styleName == _arg_1)
            {
                return;
            };
            _styleName = _arg_1;
            _styleChanged = true;
            invalidateProperties();
        }


    }
}//package com.qeedoo.ui.view.comp

