// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.ThreeDiabetesBox

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import com.qeedoo.ui.view.compDragable.ThreeDiabetes;
    import flash.geom.Rectangle;
    import flash.geom.Point;
    import mx.core.UIComponent;
    import flash.display.Bitmap;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import flash.events.MouseEvent;
    import mx.events.PropertyChangeEvent;
    import mx.events.FlexEvent;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.view.ViewManager;
    import flash.display.BitmapData;
    import flash.geom.Matrix;
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

    public class ThreeDiabetesBox extends Canvas 
    {

        private static var clickBox:ThreeDiabetesBox;
        private static var view:ThreeDiabetes;
        private static var r:Rectangle;
        private static var d:Point;

        public var num:int = 1;
        private var uic:UIComponent;
        private var bm:Bitmap;
        private var registed:Boolean = false;
        public var index:int = -1;
        public var bomb:Boolean = false;
        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":50,
                    "height":50,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":UIComponent,
                        "id":"container",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "percentWidth":100,
                                "percentHeight":100
                            });
                        }
                    })]
                });
            }
        });
        private var _410956671container:UIComponent;
        public var type:int = -1;

        public function ThreeDiabetesBox()
        {
            mx_internal::_document = this;
            this.width = 50;
            this.height = 50;
            this.addEventListener("creationComplete", ___ThreeDiabetesBox_Canvas1_creationComplete);
        }

        public function destroy():void
        {
            removeEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
            removeEventListener(MouseEvent.ROLL_OVER, mouseOver);
            if (this.parent)
            {
                parent.removeChild(this);
            };
        }

        public function set container(_arg_1:UIComponent):void
        {
            var _local_2:Object = this._410956671container;
            if (_local_2 !== _arg_1)
            {
                this._410956671container = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "container", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get container():UIComponent
        {
            return (this._410956671container);
        }

        public function setParam(_arg_1:Boolean, _arg_2:int):void
        {
            this.bomb = _arg_1;
            this.num = _arg_2;
        }

        private function init():void
        {
        }

        public function ___ThreeDiabetesBox_Canvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        public function setIndex(_arg_1:int):void
        {
            index = _arg_1;
            if (!registed)
            {
                if (index >= 36)
                {
                    addEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
                    addEventListener(MouseEvent.ROLL_OVER, mouseOver);
                    registed = true;
                };
            };
        }

        override public function initialize():void
        {
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            super.initialize();
        }

        private function mouseOver(_arg_1:MouseEvent):void
        {
            if (((!(clickBox)) || (!(_arg_1.buttonDown))))
            {
                return;
            };
            if (!view)
            {
                view = (Core.getInstance().view.getUI(ViewManager.PANEL_SUMMER_GAME_DIABETES) as ThreeDiabetes);
            };
            if ((((((clickBox.index + 1) == this.index) || ((clickBox.index - 1) == this.index)) || ((clickBox.index + 6) == this.index)) || ((clickBox.index - 6) == this.index)))
            {
                view.checkDiabetes(clickBox.index, this.index);
            };
            clickBox = null;
        }

        private function mouseDown(_arg_1:MouseEvent):void
        {
            clickBox = this;
            trace((((" index =  " + this.index) + " type =  ") + this.type));
            if (!stage.hasEventListener(MouseEvent.MOUSE_UP))
            {
                stage.addEventListener(MouseEvent.MOUSE_UP, mouseUp);
            };
        }

        private function mouseUp(_arg_1:MouseEvent):void
        {
            clickBox = null;
            if (stage.hasEventListener(MouseEvent.MOUSE_UP))
            {
                stage.removeEventListener(MouseEvent.MOUSE_UP, mouseUp);
            };
        }

        public function setType(_arg_1:int):void
        {
            if (!bm)
            {
                uic = new UIComponent();
                bm = new Bitmap();
                uic.addChild(bm);
                addChild(uic);
            };
            type = _arg_1;
            visible = true;
            if (!r)
            {
                r = new Rectangle(0, 0, 50, 50);
            };
            if (!d)
            {
                d = new Point(0, 0);
            };
            if (!bm.bitmapData)
            {
                bm.bitmapData = new BitmapData(50, 50, true, 0xFFFFFF);
            }
            else
            {
                bm.bitmapData.fillRect(r, 0xFFFFFF);
            };
            if (((type >= 0) && (type <= 4)))
            {
                bm.bitmapData.copyPixels(ThreeDiabetes.rects[type], r, d);
            }
            else
            {
                visible = false;
                return;
            };
            var _local_2:Matrix = new Matrix();
            if (this.bomb)
            {
                _local_2.ty = (bm.bitmapData.height - ThreeDiabetes.rects[5].height);
                bm.bitmapData.draw(ThreeDiabetes.rects[5], _local_2);
            }
            else
            {
                if (this.num == 2)
                {
                    _local_2.ty = (bm.bitmapData.height - ThreeDiabetes.rects[6].height);
                    bm.bitmapData.draw(ThreeDiabetes.rects[6], _local_2);
                };
            };
        }


    }
}//package com.qeedoo.ui.view.comp

