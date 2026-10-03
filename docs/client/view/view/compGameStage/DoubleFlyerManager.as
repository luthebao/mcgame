// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compGameStage.DoubleFlyerManager

package com.qeedoo.ui.view.compGameStage
{
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.view.ViewManager;
    import flash.display.DisplayObject;
    import com.qeedoo.game.predef.GamePredef;

    public class DoubleFlyerManager 
    {

        private var _flyer:FlyerView;
        public var host:CharactorView;
        private var _container:DynamicItemLayer;
        private var _flyerFront:FlyerView;
        public var guest:CharactorView;
        private var _core:Core;

        public function DoubleFlyerManager()
        {
            _core = Core.getInstance();
            _container = _core.view.getUI(ViewManager.STAGE_MAIN_CONTAINER).flyerLayer;
        }

        public function set flyer(_arg_1:FlyerView):void
        {
            _flyer = _arg_1;
            _container.addChild(_flyer);
        }

        private function containObj(_arg_1:DisplayObject):Boolean
        {
            if (((_arg_1) && (_container.contains(_arg_1))))
            {
                return (true);
            };
            return (false);
        }

        public function upFlyerDepth():void
        {
            if (((!(containObj(_flyer))) || (!(containObj(host)))))
            {
                return;
            };
            var _local_1:int = _container.getChildIndex(host);
            var _local_2:int = _local_1;
            var _local_3:int = (_container.numChildren - 1);
            if (_local_2 < 2)
            {
                _local_2 = Math.min(2, (_container.numChildren - 1));
            }
            else
            {
                if (_local_2 > (_container.numChildren - 2))
                {
                    _local_2 = Math.max(0, (_container.numChildren - 2));
                };
            };
            if (_flyerFront)
            {
                _container.setChildIndex(_flyerFront, Math.min(_local_3, (_local_2 + 1)));
            };
            if (host._cg.dir >= 4)
            {
                if (containObj(guest))
                {
                    _container.setChildIndex(guest, Math.max(0, (_local_2 - 1)));
                    _container.setChildIndex(host, _local_2);
                };
            }
            else
            {
                if (host._cg.dir == 0)
                {
                    if (containObj(guest))
                    {
                        _container.setChildIndex(guest, Math.max(0, (_local_2 - 1)));
                        _container.setChildIndex(host, _local_2);
                    };
                }
                else
                {
                    if (containObj(guest))
                    {
                        _container.setChildIndex(host, Math.max(0, (_local_2 - 1)));
                        _container.setChildIndex(guest, _local_2);
                    };
                };
            };
            _container.setChildIndex(_flyer, Math.max(0, (_local_2 - 2)));
        }

        public function removeFlyer():void
        {
            if (_flyer)
            {
                _flyer.removeFlyer();
            };
            if (_flyerFront)
            {
                _flyerFront.removeFlyer();
            };
        }

        public function set flyerFront(_arg_1:FlyerView):void
        {
            _flyerFront = _arg_1;
            _container.addChild(_flyerFront);
        }

        public function upFlyerPos():void
        {
            var _local_1:Number;
            var _local_2:Number;
            var _local_3:Number;
            var _local_4:Number;
            var _local_5:Number;
            if (((host) && (host._cg)))
            {
                _local_1 = ((-(Number(host._cg.dir)) * Math.PI) / 4);
                _local_2 = Math.cos(_local_1);
                _local_3 = Math.sin(_local_1);
                _local_4 = ((-(GamePredef.DFLYING_DISTANCE_NORMAL) / 2) * _local_2);
                _local_5 = ((-(GamePredef.DFLYING_DISTANCE_NORMAL) / 4) * _local_3);
                if (_flyer)
                {
                    _flyer.setFlyerXY(host, _local_4, _local_5);
                };
                if (_flyerFront)
                {
                    _flyerFront.setFlyerXY(host, _local_4, _local_5);
                };
            };
            if (guest)
            {
                guest.coordinateSelfXY();
            };
            upFlyerDepth();
        }


    }
}//package com.qeedoo.ui.view.compGameStage

