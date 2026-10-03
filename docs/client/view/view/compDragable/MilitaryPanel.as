// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.MilitaryPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.containers.Canvas;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import com.qeedoo.game.view.ViewManager;
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

    public class MilitaryPanel extends DragableCanvas 
    {

        private var _584079194btn_exchange:BasicGlowButton;
        private var _1074097225funCanvas:Canvas;
        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":70,
                    "height":37,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"funCanvas",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":70,
                                "height":37,
                                "styleName":"RightButtonBackground",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"btn_exchange",
                                    "events":{"click":"__btn_exchange_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "6";
                                        this.right = "6";
                                        this.paddingTop = 2;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":6,
                                            "width":55,
                                            "height":25,
                                            "styleName":"BtnStdRed",
                                            "label":"军衔"
                                        });
                                    }
                                })]
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();

        public function MilitaryPanel()
        {
            mx_internal::_document = this;
            this.width = 70;
            this.height = 37;
        }

        [Bindable(event="propertyChange")]
        public function get btn_exchange():BasicGlowButton
        {
            return (this._584079194btn_exchange);
        }

        public function showPanel():void
        {
            this.visible = true;
        }

        public function set btn_exchange(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._584079194btn_exchange;
            if (_local_2 !== _arg_1)
            {
                this._584079194btn_exchange = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btn_exchange", _local_2, _arg_1));
            };
        }

        public function __btn_exchange_click(_arg_1:MouseEvent):void
        {
            showMagicArrayPanel();
        }

        override public function initialize():void
        {
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            super.initialize();
        }

        [Bindable(event="propertyChange")]
        public function get funCanvas():Canvas
        {
            return (this._1074097225funCanvas);
        }

        public function showMagicArrayPanel():void
        {
            this.visible = false;
            var _local_1:Object = _core.view.getUI(ViewManager.PANEL_MAGIC_ARRAY);
            if (_local_1)
            {
                _local_1.showPanel();
            };
        }

        public function set funCanvas(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1074097225funCanvas;
            if (_local_2 !== _arg_1)
            {
                this._1074097225funCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "funCanvas", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

