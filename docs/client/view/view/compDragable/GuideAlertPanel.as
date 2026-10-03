// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.GuideAlertPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.core.UIComponentDescriptor;
    import mx.controls.Button;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import com.qeedoo.game.object.Npc;
    import com.qeedoo.game.predef.GamePredef;
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

    public class GuideAlertPanel extends DragableCanvas 
    {

        private var _guideStep:Object;
        private var _1464826535_title:String;
        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":339,
                    "height":300,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Button,
                        "events":{"click":"___GuideAlertPanel_Button1_click"},
                        "stylesFactory":function ():void
                        {
                            this.bottom = "10";
                            this.horizontalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"BtnBeginGuide",
                                "enabled":true
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();

        public function GuideAlertPanel()
        {
            mx_internal::_document = this;
            this.width = 339;
            this.height = 300;
            this.styleName = "CanvasGuide";
            this.movable = false;
        }

        private function set _title(_arg_1:String):void
        {
            var _local_2:Object = this._1464826535_title;
            if (_local_2 !== _arg_1)
            {
                this._1464826535_title = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_title", _local_2, _arg_1));
            };
        }

        public function ___GuideAlertPanel_Button1_click(_arg_1:MouseEvent):void
        {
            findNpc();
        }

        public function findNpc():void
        {
            var _local_1:Object;
            var _local_2:Object;
            var _local_3:Npc;
            if (((_guideStep) && (_guideStep.findNpcId > 0)))
            {
                _local_1 = _core.data.gameDataIndex[GamePredef.TBL_NPC][_core.player.posMapId];
                for each (_local_2 in _local_1)
                {
                    if (_local_2.id == _guideStep.findNpcId)
                    {
                        _local_3 = _core.getNpc(_local_2.id);
                        _local_3.view.clickNpc();
                        break;
                    };
                };
            };
            visible = false;
        }

        override public function initialize():void
        {
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            super.initialize();
        }

        [Bindable(event="propertyChange")]
        private function get _title():String
        {
            return (this._1464826535_title);
        }

        public function init(_arg_1:Object):void
        {
            visible = true;
            _guideStep = _arg_1;
        }


    }
}//package com.qeedoo.ui.view.compDragable

