// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.UIBase

package com.qeedoo.ui.view.comp
{
    import mx.events.FlexEvent;
    import com.qeedoo.MMOGame;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.vo.UIPropVO;
    import flash.events.Event;
    import mx.core.UIComponent;

    public class UIBase extends SimpleCanvas 
    {

        public static const CREATE_LIST_COMPLETE:String = "UI_EVENT_CREATE_LIST_COMPLETE";
        private static var _currentCount:int;
        private static var _totalCount:int;
        private static var _title:String;

        public var uiList:Array;
        private var _last:Boolean;

        public function UIBase()
        {
            _totalCount = -1;
            addEventListener(FlexEvent.CREATION_COMPLETE, nextHandler);
        }

        private function createLater(_arg_1:UIPropVO):void
        {
            _last = _arg_1.isLast;
            if (_arg_1.type != null)
            {
                _title = _arg_1.type;
                _totalCount = -1;
            };
            if (((MMOGame.info) && (_arg_1.name)))
            {
                MMOGame.info.showModel(MMOGame.app, (Language.UIBASE_S[0] + _arg_1.name), (Language.UIBASE_S[1] + _title));
            };
            _arg_1.parent = this;
            ViewManager.getInstance().addVO(_arg_1.vid, _arg_1);
            createNext();
        }

        private function nextHandler(_arg_1:Event):void
        {
            _arg_1.currentTarget.removeEventListener(FlexEvent.CREATION_COMPLETE, createNext);
            _arg_1.currentTarget.removeEventListener(CREATE_LIST_COMPLETE, createNext);
            createNext();
        }

        private function initUI(_arg_1:UIPropVO):void
        {
            var _local_4:Object;
            var _local_5:Object;
            _last = _arg_1.isLast;
            if (_arg_1.type != null)
            {
                _title = _arg_1.type;
                _totalCount = -1;
            };
            if (((MMOGame.info) && (_arg_1.name)))
            {
                MMOGame.info.showModel(MMOGame.app, (Language.UIBASE_S[0] + _arg_1.name), (Language.UIBASE_S[1] + _title));
            };
            var _local_2:UIComponent = new ((_arg_1.cls as Class))();
            var _local_3:UIBase = (_local_2 as UIBase);
            if (_local_3)
            {
                _local_3.addEventListener(CREATE_LIST_COMPLETE, nextHandler);
            }
            else
            {
                _local_2.addEventListener(FlexEvent.CREATION_COMPLETE, nextHandler);
            };
            addChild(_local_2);
            for (_local_4 in _arg_1.prop)
            {
                _local_2[_local_4] = _arg_1.prop[_local_4];
            };
            for (_local_5 in _arg_1.style)
            {
                _local_2.setStyle(_local_5.toString(), _arg_1.style[_local_5].toString());
            };
            ViewManager.getInstance().addUI(_arg_1.vid, _local_2, _arg_1.initVisible);
        }

        private function createNext():void
        {
            if (_totalCount < 0)
            {
                _totalCount = uiList.length;
                _currentCount = 0;
            };
            var _local_1:UIPropVO = uiList.shift();
            _currentCount++;
            if (_local_1)
            {
                if (_local_1.createLater)
                {
                    createLater(_local_1);
                }
                else
                {
                    initUI(_local_1);
                };
            }
            else
            {
                dispatchEvent(new Event(CREATE_LIST_COMPLETE));
                if (_last)
                {
                    MMOGame.info.complete();
                };
            };
        }


    }
}//package com.qeedoo.ui.view.comp

