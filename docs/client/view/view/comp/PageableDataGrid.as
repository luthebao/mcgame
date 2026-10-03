// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.PageableDataGrid

package com.qeedoo.ui.view.comp
{
    import mx.controls.DataGrid;
    import mx.controls.dataGridClasses.DataGridColumn;
    import mx.collections.ArrayCollection;
    import mx.events.DataGridEvent;
    import mx.core.EventPriority;
    import mx.collections.Sort;
    import mx.collections.SortField;
    import com.qeedoo.ui.utils.ToolKit;
    import mx.controls.dataGridClasses.DataGridHeader;
    import mx.core.mx_internal; 

    use namespace mx_internal;

    public class PageableDataGrid extends DataGrid 
    {

        private var manualSort:Boolean;
        private var _pageSelector:PageSelector;
        private var sortColumn:DataGridColumn;
        private var _dataAll:ArrayCollection;

        public function PageableDataGrid()
        {
            addEventListener(DataGridEvent.HEADER_RELEASE, myHeaderReleaseHandler, false, EventPriority.DEFAULT);
        }

        private function myHeaderReleaseHandler(_arg_1:DataGridEvent):void
        {
            if (!_arg_1.isDefaultPrevented())
            {
                manualSort = true;
                sortByColumn(_arg_1.columnIndex);
                manualSort = false;
            };
        }

        private function sortByColumn(_arg_1:int):void
        {
            var _local_4:Sort;
            var _local_5:SortField;
            var _local_6:String;
            var _local_7:Array;
            var _local_8:int;
            var _local_2:DataGridColumn = columns[_arg_1];
            var _local_3:Boolean = _local_2.sortDescending;
            if (_local_2.sortable)
            {
                _local_4 = collection.sort;
                if (_local_4)
                {
                    _local_4.compareFunction = null;
                    _local_7 = _local_4.fields;
                    if (_local_7)
                    {
                        _local_8 = 0;
                        while (_local_8 < _local_7.length)
                        {
                            if (_local_7[_local_8].name == _local_2.dataField)
                            {
                                _local_5 = _local_7[_local_8];
                                _local_3 = (!(_local_5.descending));
                                break;
                            };
                            _local_8++;
                        };
                    };
                }
                else
                {
                    _local_4 = new Sort();
                };
                if (!_local_5)
                {
                    _local_5 = new SortField(_local_2.dataField);
                };
                _local_2.sortDescending = _local_3;
                _local_6 = ((_local_3) ? "DESC" : "ASC");
                sortDirection = _local_6;
                lastSortIndex = sortIndex;
                sortIndex = _arg_1;
                sortColumn = _local_2;
                _local_5.name = _local_2.dataField;
                if (_local_2.sortCompareFunction != null)
                {
                    _local_5.compareFunction = _local_2.sortCompareFunction;
                }
                else
                {
                    _local_5.compareFunction = null;
                };
                _local_5.descending = _local_3;
                _local_4.fields = [_local_5];
            };
            dataAll.sort = _local_4;
            dataAll.refresh();
            if (pageSelector)
            {
                dataProvider = ToolKit.getPageCollection(dataAll, 0, pageSelector.pageSize);
                pageSelector.currentPage = 0;
            };
        }

        public function set dataAll(_arg_1:ArrayCollection):void
        {
            _dataAll = _arg_1;
        }

        public function get pageSelector():PageSelector
        {
            return (_pageSelector);
        }

        public function get dataAll():ArrayCollection
        {
            return ((_dataAll) || (new ArrayCollection()));
        }

        override protected function placeSortArrow():void
        {
            DataGridHeader(header)._placeSortArrow();
            if (lockedColumnHeader)
            {
                DataGridHeader(lockedColumnHeader)._placeSortArrow();
            };
        }

        public function set pageSelector(_arg_1:PageSelector):void
        {
            _pageSelector = _arg_1;
        }


    }
}//package com.qeedoo.ui.view.comp

