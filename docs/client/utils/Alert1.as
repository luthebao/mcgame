// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.game.utils.Alert1

package com.qeedoo.game.utils
{
    import mx.controls.Alert;
    import flash.display.Sprite;
    import mx.core.Application;
    import mx.events.CloseEvent;
    import mx.core.UIComponent;
    import mx.managers.PopUpManager;

    public class Alert1 extends Alert 
    {

        public static var alertDelay:uint = 1000;
        private static var last_time:uint;


        public static function show(_arg_1:String="", _arg_2:String="", _arg_3:uint=4, _arg_4:Sprite=null, _arg_5:Function=null, _arg_6:Class=null, _arg_7:uint=4):Alert
        {
            var _local_10:uint;
            if (last_time)
            {
                _local_10 = new Date().getTime();
                if ((_local_10 - last_time) < alertDelay)
                {
                    return (null);
                };
            };
            last_time = new Date().getTime();
            var _local_8:Boolean = ((_arg_3 & Alert.NONMODAL) ? false : true);
            if (!_arg_4)
            {
                _arg_4 = Sprite(Application.application);
            };
            var _local_9:Alert = new Alert();
            if (((((_arg_3 & Alert.OK) || (_arg_3 & Alert.CANCEL)) || (_arg_3 & Alert.YES)) || (_arg_3 & Alert.NO)))
            {
                _local_9.buttonFlags = _arg_3;
            };
            if (((((_arg_7 == Alert.OK) || (_arg_7 == Alert.CANCEL)) || (_arg_7 == Alert.YES)) || (_arg_7 == Alert.NO)))
            {
                _local_9.defaultButtonFlag = _arg_7;
            };
            _local_9.text = _arg_1;
            _local_9.title = _arg_2;
            _local_9.iconClass = _arg_6;
            if (_arg_5 != null)
            {
                _local_9.addEventListener(CloseEvent.CLOSE, _arg_5);
            };
            if ((_arg_4 is UIComponent))
            {
                _local_9.moduleFactory = UIComponent(_arg_4).moduleFactory;
            };
            PopUpManager.addPopUp(_local_9, _arg_4, _local_8);
            _local_9.setActualSize(_local_9.getExplicitOrMeasuredWidth(), _local_9.getExplicitOrMeasuredHeight());
            return (_local_9);
        }


    }
}//package com.qeedoo.game.utils

