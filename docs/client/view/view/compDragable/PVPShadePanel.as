// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.PVPShadePanel

package com.qeedoo.ui.view.compDragable
{
    import mx.containers.Canvas;
    import mx.controls.Image;
    import mx.core.UIComponentDescriptor;
    import mx.controls.Button;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import com.qeedoo.game.view.ViewManager;
    import flash.events.MouseEvent;
    import com.qeedoo.ui.resource.ResManager;
    import mx.events.PropertyChangeEvent;
    import mx.events.FlexEvent;
    import flash.events.*;
    import flash.display.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.text.*;
    import flash.media.*;
    import mx.binding.*;
    import flash.net.*;
    import flash.utils.*;
    import flash.system.*;
    import flash.accessibility.*;
    import flash.ui.*;
    import flash.filters.*;
    import flash.external.*;
    import flash.debugger.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.xml.*;

    public class PVPShadePanel extends Canvas 
    {

        private var _347234980backImg:Image;
        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({"childDescriptors":[new UIComponentDescriptor({
                        "type":Image,
                        "id":"backImg",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":0,
                                "y":0,
                                "percentWidth":100,
                                "percentHeight":100
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Button,
                        "events":{"click":"___PVPShadePanel_Button1_click"},
                        "stylesFactory":function ():void
                        {
                            this.right = "52";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":480,
                                "styleName":"BtnWbQuit",
                                "height":50,
                                "width":50
                            });
                        }
                    })]});
            }
        });
        private var _core:Core = Core.getInstance();

        public function PVPShadePanel()
        {
            mx_internal::_document = this;
            this.x = 0;
            this.y = 0;
            this.percentWidth = 100;
            this.percentHeight = 100;
            this.addEventListener("creationComplete", ___PVPShadePanel_Canvas1_creationComplete);
        }

        [Bindable(event="propertyChange")]
        public function get backImg():Image
        {
            return (this._347234980backImg);
        }

        public function showPVPShadePanel():void
        {
            var _local_1:*;
            _local_1 = _core.view.getUI(ViewManager.MAIN_QUEST_GUIDE);
            if (_local_1)
            {
                _local_1.hide();
            };
            _local_1 = _core.view.getUI(ViewManager.MAIN_MINIMAP);
            if (_local_1)
            {
                _local_1.visible = false;
            };
            _local_1 = _core.view.getUI(ViewManager.MAIN_ACTIVITY);
            if (_local_1)
            {
                _local_1.visible = false;
            };
            _local_1 = _core.view.getUI(ViewManager.MAIN_USER_BAR);
            if (_local_1)
            {
                _local_1.visible = false;
            };
            _local_1 = _core.view.getUI(ViewManager.MAIN_GROUP);
            if (_local_1)
            {
                _local_1.visible = false;
            };
            _local_1 = _core.view.getUI(ViewManager.MAIN_SYS);
            if (_local_1)
            {
                _local_1.setSysBtnBarState(false);
            };
            this.visible = true;
        }

        public function closePVPShadePanel():void
        {
            var _local_1:*;
            _local_1 = _core.view.getUI(ViewManager.MAIN_QUEST_GUIDE);
            if (_local_1)
            {
                _local_1.show();
            };
            _local_1 = _core.view.getUI(ViewManager.MAIN_MINIMAP);
            if (_local_1)
            {
                _local_1.visible = true;
            };
            _local_1 = _core.view.getUI(ViewManager.MAIN_ACTIVITY);
            if (_local_1)
            {
                _local_1.visible = true;
            };
            _local_1 = _core.view.getUI(ViewManager.MAIN_USER_BAR);
            if (_local_1)
            {
                _local_1.visible = true;
            };
            _local_1 = _core.view.getUI(ViewManager.MAIN_GROUP);
            if (_local_1)
            {
                _local_1.visible = true;
            };
            _local_1 = _core.view.getUI(ViewManager.MAIN_SYS);
            if (_local_1)
            {
                _local_1.setSysBtnBarState(true);
            };
            _local_1 = _core.view.getUI(ViewManager.POPU_PVP_WAIT);
            if (_local_1)
            {
                _local_1.visible = false;
            };
            _local_1 = _core.view.getUI(ViewManager.PANEL_PVP_ROOM_LIST);
            if (_local_1)
            {
                _local_1.visible = false;
            };
            this.visible = false;
        }

        public function ___PVPShadePanel_Button1_click(_arg_1:MouseEvent):void
        {
            exitPVPRoom();
        }

        public function showPVPShadePanel2():void
        {
            var _local_1:*;
            _local_1 = _core.view.getUI(ViewManager.MAIN_QUEST_GUIDE);
            if (_local_1)
            {
                _local_1.hide();
            };
            _local_1 = _core.view.getUI(ViewManager.MAIN_MINIMAP);
            if (_local_1)
            {
                _local_1.visible = false;
            };
            _local_1 = _core.view.getUI(ViewManager.MAIN_ACTIVITY);
            if (_local_1)
            {
                _local_1.visible = false;
            };
            _local_1 = _core.view.getUI(ViewManager.MAIN_USER_BAR);
            if (_local_1)
            {
                _local_1.visible = false;
            };
            _local_1 = _core.view.getUI(ViewManager.MAIN_GROUP);
            if (_local_1)
            {
                _local_1.visible = false;
            };
            _local_1 = _core.view.getUI(ViewManager.MAIN_SYS);
            if (_local_1)
            {
                _local_1.setSysBtnBarState(false);
            };
            _local_1 = _core.view.getUI(ViewManager.PANEL_PVP_ROOM_LIST);
            if (((!(_local_1)) || (!(_local_1.visible))))
            {
                this.visible = true;
            };
        }

        override public function initialize():void
        {
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            super.initialize();
        }

        private function exitPVPRoom():void
        {
            _core.remote.call("leavePVPRoom", null);
        }

        private function init():void
        {
            backImg.source = ResManager.hash(ResManager.getIconUrlNoHash(3130090000056));
        }

        public function set backImg(_arg_1:Image):void
        {
            var _local_2:Object = this._347234980backImg;
            if (_local_2 !== _arg_1)
            {
                this._347234980backImg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "backImg", _local_2, _arg_1));
            };
        }

        public function ___PVPShadePanel_Canvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }


    }
}//package com.qeedoo.ui.view.compDragable

