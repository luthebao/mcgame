// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.FarmMasterCube

package com.qeedoo.ui.view.compDragable
{
    import mx.controls.Button;
    import flash.events.Event;
    import flash.events.MouseEvent;

    public class FarmMasterCube extends Button 
    {

        public var clickFunc:Function;
        private var _rowIndex:uint;
        private var _type:int;
        private var _columnIndex:uint;

        public function FarmMasterCube()
        {
            this.width = 50;
            this.height = 50;
            this.addEventListener("click", ___FarmMasterCube_Button1_click);
        }

        public function get type():int
        {
            return (_type);
        }

        public function set columnIndex(_arg_1:uint):void
        {
            _columnIndex = _arg_1;
        }

        public function clickCall(_arg_1:Event):void
        {
            ((clickFunc) && (clickFunc(_arg_1)));
        }

        public function get rowIndex():uint
        {
            return (_rowIndex);
        }

        public function set rowIndex(_arg_1:uint):void
        {
            _rowIndex = _arg_1;
        }

        override public function initialize():void
        {
            super.initialize();
        }

        public function set type(_arg_1:int):void
        {
            _type = _arg_1;
            switch (_type)
            {
                case 0:
                    styleName = "farmMaster";
                    return;
                case 1:
                    styleName = "openedLandMaster";
                    return;
                case 2:
                    styleName = "rockLandMaster";
                    return;
                case 3:
                    styleName = "canOpenUpMaster";
                    return;
            };
        }

        public function ___FarmMasterCube_Button1_click(_arg_1:MouseEvent):void
        {
            clickCall(_arg_1);
        }

        public function get columnIndex():uint
        {
            return (_columnIndex);
        }


    }
}//package com.qeedoo.ui.view.compDragable

