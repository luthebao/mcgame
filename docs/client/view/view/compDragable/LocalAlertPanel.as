// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.LocalAlertPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.core.UIComponentDescriptor;
    import mx.controls.Button;
    import mx.core.mx_internal;
    import flash.events.MouseEvent;

    public class LocalAlertPanel extends DragableCanvas 
    {

        private var _callBack:Function;
        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":462,
                    "height":381,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Button,
                        "events":{"click":"___LocalAlertPanel_Button1_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":189.5,
                                "y":330,
                                "width":83,
                                "height":32,
                                "styleName":"CanvasGuideLocalTY"
                            });
                        }
                    })]
                });
            }
        });

        public function LocalAlertPanel()
        {
            mx_internal::_document = this;
            this.width = 462;
            this.height = 381;
            this.styleName = "CanvasGuideLocal";
        }

        override public function initialize():void
        {
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            super.initialize();
        }

        private function allow():void
        {
            if (_callBack)
            {
                _callBack();
            };
            this.hide();
        }

        public function setGuide(_arg_1:Function):void
        {
            this._callBack = _arg_1;
            this.show();
        }

        public function ___LocalAlertPanel_Button1_click(_arg_1:MouseEvent):void
        {
            allow();
        }


    }
}//package com.qeedoo.ui.view.compDragable

