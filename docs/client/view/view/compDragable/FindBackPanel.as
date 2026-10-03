// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.FindBackPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.ComboBox;
    import mx.controls.Image;
    import mx.controls.RadioButtonGroup;
    import mx.controls.Label;
    import mx.containers.Canvas;
    import com.qeedoo.ui.view.comp.DelayButton;
    import mx.containers.VBox;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.core.UIComponentDescriptor;
    import mx.controls.RadioButton;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.resource.ResManager;
    import mx.events.PropertyChangeEvent;
    import flash.net.Responder;
    import com.qeedoo.game.predef.GamePredef;
    import mx.controls.Alert;
    import mx.events.ListEvent;
    import mx.events.FlexEvent;
    import mx.binding.Binding;
    import flash.utils.getDefinitionByName;
    import mx.collections.ArrayCollection;
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

    use namespace mx_internal;

    public class FindBackPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _2015112679refreshBanner:ComboBox;
        private var _3236049img4:Image;
        private var _164873553radiogroup5:RadioButtonGroup;
        private var _1110417470label6:Label;
        private var _63203276label22:Label;
        private var _3236052img7:Image;
        private var _63203121label72:Label;
        private var _2079535684Canvas4:Canvas;
        private var _1110417475label1:Label;
        private var _63203245label32:Label;
        private var _2085022877btnFind2:DelayButton;
        private var xuanshangExp:Number = 0;
        private var _2085022879btnFind4:DelayButton;
        private var xuanshangColor:Number = 0;
        private var _2085022880btnFind5:DelayButton;
        private var findBackExpType2:int = 1;
        private var findBackExpType3:int = 1;
        private var findBackExpType4:int = 1;
        private var _1110417469label7:Label;
        private var findBackExpType6:int = 1;
        private var findBackExpType1:int = 1;
        private var _3236048img3:Image;
        private var _2085022882btnFind7:DelayButton;
        private var _2079535682Canvas6:Canvas;
        private var findBackExpType7:int = 1;
        private var _898049649vb_quest:VBox;
        private var _1110417472label4:Label;
        private var _63203214label42:Label;
        private var _63203184label51:Label;
        private var _3236051img6:Image;
        private var _164873552radiogroup4:RadioButtonGroup;
        private var findBackExpType5:int = 1;
        private var xuanshangRefreshNum:Number = 0;
        private var _164873555radiogroup7:RadioButtonGroup;
        private var _63203153label61:Label;
        private var _2079535687Canvas1:Canvas;
        private var _63203307label12:Label;
        private var _3236047img2:Image;
        private var _63203277label21:Label;
        private var _1110417474label2:Label;
        private var _63203122label71:Label;
        private var _3236050img5:Image;
        private var _2079535685Canvas3:Canvas;
        private var _63203246label31:Label;
        public var _FindBackPanel_Label13:Label;
        public var _FindBackPanel_Label17:Label;
        private var _164873551radiogroup3:RadioButtonGroup;
        private var _1110417471label5:Label;
        public var _FindBackPanel_BasicTitleCanvas1:BasicTitleCanvas;
        public var _FindBackPanel_Label21:Label;
        public var _FindBackPanel_Label25:Label;
        private var goldRate:Number = 1;
        private var _2085022878btnFind3:DelayButton;
        private var _164873554radiogroup6:RadioButtonGroup;
        private var _2079535683Canvas5:Canvas;
        private var _2085022876btnFind1:DelayButton;
        private var _63203215label41:Label;
        private var _3236046img1:Image;
        private var _2085022881btnFind6:DelayButton;
        private var _2079535681Canvas7:Canvas;
        private var _164873549radiogroup1:RadioButtonGroup;
        private var moneyRate:Number = 1;
        private var _63203183label52:Label;
        private var xuanshangNum:Number = 0;
        private var _63203308label11:Label;
        private var _1110417473label3:Label;
        public var _FindBackPanel_Label1:Label;
        public var _FindBackPanel_Label5:Label;
        public var _FindBackPanel_Label9:Label;
        private var _164873550radiogroup2:RadioButtonGroup;
        private var _63203152label62:Label;
        private var _2079535686Canvas2:Canvas;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":600,
                    "height":470,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_FindBackPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.right = "10";
                            this.left = "10";
                            this.bottom = "20";
                            this.top = "40";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "horizontalScrollPolicy":"off",
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "stylesFactory":function ():void
                                    {
                                        this.bottom = "10";
                                        this.top = "10";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "horizontalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":VBox,
                                                "id":"vb_quest",
                                                "stylesFactory":function ():void
                                                {
                                                    this.horizontalGap = 1;
                                                    this.right = "5";
                                                    this.left = "5";
                                                    this.top = "0";
                                                    this.bottom = "0";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "horizontalScrollPolicy":"off",
                                                        "width":560,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "id":"Canvas1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "5";
                                                                this.top = "5";
                                                                this.right = "5";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":545,
                                                                    "horizontalScrollPolicy":"off",
                                                                    "height":120,
                                                                    "styleName":"CanvasBorder",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_FindBackPanel_Label1",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "10";
                                                                            this.fontSize = 14;
                                                                            this.color = 0xFFFF00;
                                                                            this.top = "3";
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"img1",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "10";
                                                                            this.verticalCenter = "6";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "width":60,
                                                                                "height":60
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":RadioButton,
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":110,
                                                                                "y":48,
                                                                                "groupName":"radiogroup1",
                                                                                "value":1,
                                                                                "selected":true,
                                                                                "width":17
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":RadioButton,
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":110,
                                                                                "y":78,
                                                                                "groupName":"radiogroup1",
                                                                                "value":2,
                                                                                "width":17
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"label11",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":130,
                                                                                "y":48
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"label12",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":130,
                                                                                "y":78
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":DelayButton,
                                                                        "id":"btnFind1",
                                                                        "events":{"click":"__btnFind1_click"},
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":470,
                                                                                "y":18,
                                                                                "styleName":"BtnStdRed",
                                                                                "labelPlacement":"bottom",
                                                                                "height":20
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"label1",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":120,
                                                                                "y":18,
                                                                                "width":330
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "id":"Canvas2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "5";
                                                                this.right = "5";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":545,
                                                                    "horizontalScrollPolicy":"off",
                                                                    "height":120,
                                                                    "styleName":"CanvasBorder",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_FindBackPanel_Label5",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "10";
                                                                            this.fontSize = 14;
                                                                            this.color = 0xFFFF00;
                                                                            this.top = "3";
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"img2",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "10";
                                                                            this.verticalCenter = "6";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "width":60,
                                                                                "height":60
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":RadioButton,
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":110,
                                                                                "y":48,
                                                                                "groupName":"radiogroup2",
                                                                                "value":1,
                                                                                "selected":true,
                                                                                "width":17
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":RadioButton,
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":110,
                                                                                "y":78,
                                                                                "groupName":"radiogroup2",
                                                                                "value":2,
                                                                                "width":17
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"label21",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":130,
                                                                                "y":48
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"label22",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":130,
                                                                                "y":78
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":DelayButton,
                                                                        "id":"btnFind2",
                                                                        "events":{"click":"__btnFind2_click"},
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":470,
                                                                                "y":18,
                                                                                "styleName":"BtnStdRed",
                                                                                "labelPlacement":"bottom",
                                                                                "height":20
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"label2",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":120,
                                                                                "y":18,
                                                                                "width":330
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "id":"Canvas3",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "5";
                                                                this.right = "5";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":545,
                                                                    "horizontalScrollPolicy":"off",
                                                                    "height":120,
                                                                    "styleName":"CanvasBorder",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_FindBackPanel_Label9",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "10";
                                                                            this.fontSize = 14;
                                                                            this.color = 0xFFFF00;
                                                                            this.top = "3";
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"img3",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "10";
                                                                            this.verticalCenter = "6";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "width":60,
                                                                                "height":60
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":RadioButton,
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":110,
                                                                                "y":48,
                                                                                "groupName":"radiogroup3",
                                                                                "value":1,
                                                                                "selected":true,
                                                                                "width":17
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":RadioButton,
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":110,
                                                                                "y":78,
                                                                                "groupName":"radiogroup3",
                                                                                "value":2,
                                                                                "width":17
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"label31",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":130,
                                                                                "y":48
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"label32",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":130,
                                                                                "y":78
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":DelayButton,
                                                                        "id":"btnFind3",
                                                                        "events":{"click":"__btnFind3_click"},
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":470,
                                                                                "y":18,
                                                                                "styleName":"BtnStdRed",
                                                                                "labelPlacement":"bottom",
                                                                                "height":20
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"label3",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":120,
                                                                                "y":18,
                                                                                "width":330
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "id":"Canvas4",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "5";
                                                                this.right = "5";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":545,
                                                                    "horizontalScrollPolicy":"off",
                                                                    "height":120,
                                                                    "styleName":"CanvasBorder",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_FindBackPanel_Label13",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "10";
                                                                            this.fontSize = 14;
                                                                            this.color = 0xFFFF00;
                                                                            this.top = "3";
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"img4",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "10";
                                                                            this.verticalCenter = "6";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "width":60,
                                                                                "height":60
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":RadioButton,
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":110,
                                                                                "y":48,
                                                                                "groupName":"radiogroup4",
                                                                                "value":1,
                                                                                "selected":true,
                                                                                "width":17
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":RadioButton,
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":110,
                                                                                "y":78,
                                                                                "groupName":"radiogroup4",
                                                                                "value":2,
                                                                                "width":17
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"label41",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":130,
                                                                                "y":48
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"label42",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":130,
                                                                                "y":78
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":DelayButton,
                                                                        "id":"btnFind4",
                                                                        "events":{"click":"__btnFind4_click"},
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":470,
                                                                                "y":18,
                                                                                "styleName":"BtnStdRed",
                                                                                "labelPlacement":"bottom",
                                                                                "height":20
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"label4",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":120,
                                                                                "y":18,
                                                                                "width":330
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "id":"Canvas5",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "5";
                                                                this.right = "5";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":545,
                                                                    "horizontalScrollPolicy":"off",
                                                                    "height":120,
                                                                    "styleName":"CanvasBorder",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_FindBackPanel_Label17",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "10";
                                                                            this.fontSize = 14;
                                                                            this.color = 0xFFFF00;
                                                                            this.top = "3";
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"img5",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "10";
                                                                            this.verticalCenter = "6";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "width":60,
                                                                                "height":60
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":RadioButton,
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":110,
                                                                                "y":48,
                                                                                "groupName":"radiogroup5",
                                                                                "value":1,
                                                                                "selected":true,
                                                                                "width":17
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":RadioButton,
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":110,
                                                                                "y":78,
                                                                                "groupName":"radiogroup5",
                                                                                "value":2,
                                                                                "width":17
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"label51",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":130,
                                                                                "y":48
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"label52",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":130,
                                                                                "y":78
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":DelayButton,
                                                                        "id":"btnFind5",
                                                                        "events":{"click":"__btnFind5_click"},
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":470,
                                                                                "y":18,
                                                                                "styleName":"BtnStdRed",
                                                                                "labelPlacement":"bottom",
                                                                                "height":20
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"label5",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":120,
                                                                                "y":18,
                                                                                "width":330
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "id":"Canvas6",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "5";
                                                                this.right = "5";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":545,
                                                                    "horizontalScrollPolicy":"off",
                                                                    "height":120,
                                                                    "styleName":"CanvasBorder",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_FindBackPanel_Label21",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "10";
                                                                            this.fontSize = 14;
                                                                            this.color = 0xFFFF00;
                                                                            this.top = "3";
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"img6",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "10";
                                                                            this.verticalCenter = "6";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "width":60,
                                                                                "height":60
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":RadioButton,
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":110,
                                                                                "y":48,
                                                                                "groupName":"radiogroup6",
                                                                                "value":1,
                                                                                "selected":true,
                                                                                "width":17
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":RadioButton,
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":110,
                                                                                "y":78,
                                                                                "groupName":"radiogroup6",
                                                                                "value":2,
                                                                                "width":17
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"label61",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":130,
                                                                                "y":48
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"label62",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":130,
                                                                                "y":78
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"label6",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":120,
                                                                                "y":18,
                                                                                "width":330
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":DelayButton,
                                                                        "id":"btnFind6",
                                                                        "events":{"click":"__btnFind6_click"},
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":470,
                                                                                "y":18,
                                                                                "styleName":"BtnStdRed",
                                                                                "labelPlacement":"bottom",
                                                                                "height":20
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "id":"Canvas7",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "5";
                                                                this.right = "5";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":545,
                                                                    "horizontalScrollPolicy":"off",
                                                                    "height":120,
                                                                    "styleName":"CanvasBorder",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"_FindBackPanel_Label25",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "10";
                                                                            this.fontSize = 14;
                                                                            this.color = 0xFFFF00;
                                                                            this.top = "3";
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"img7",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.left = "10";
                                                                            this.verticalCenter = "6";
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "width":60,
                                                                                "height":60
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":RadioButton,
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":110,
                                                                                "y":48,
                                                                                "groupName":"radiogroup7",
                                                                                "value":1,
                                                                                "selected":true,
                                                                                "width":17
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":RadioButton,
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":110,
                                                                                "y":78,
                                                                                "groupName":"radiogroup7",
                                                                                "value":2,
                                                                                "width":17
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"label71",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":130,
                                                                                "y":48
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"label72",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":130,
                                                                                "y":78
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ComboBox,
                                                                        "id":"refreshBanner",
                                                                        "events":{"change":"__refreshBanner_change"},
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":350,
                                                                                "y":48,
                                                                                "width":150,
                                                                                "rowCount":6
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":Label,
                                                                        "id":"label7",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.color = 0xFFFFFF;
                                                                        },
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":120,
                                                                                "y":18,
                                                                                "width":330
                                                                            });
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":DelayButton,
                                                                        "id":"btnFind7",
                                                                        "events":{"click":"__btnFind7_click"},
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({
                                                                                "x":450,
                                                                                "y":18,
                                                                                "styleName":"BtnStdRed",
                                                                                "labelPlacement":"bottom",
                                                                                "height":20
                                                                            });
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            })]
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
        private var bannerIds:Array = [1330, 1331, 1332, 1333, 1335, 731];
        private var awardNum:Array = [1, 2, 8, 12, 20, 2];
        private var basicCostArr:Array = [10, 5, 10, 30, 30, 5, 5];
        private var findBackNumArr:Array = new Array();
        private var basicMoneyCostArr:Array = [200000, 100000, 400000, 300000, 300000, 0, 100000];
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function FindBackPanel()
        {
            mx_internal::_document = this;
            this.width = 600;
            this.height = 470;
            this.styleName = "StandardContent";
            this.cacheAsBitmap = true;
            _FindBackPanel_RadioButtonGroup1_i();
            _FindBackPanel_RadioButtonGroup2_i();
            _FindBackPanel_RadioButtonGroup3_i();
            _FindBackPanel_RadioButtonGroup4_i();
            _FindBackPanel_RadioButtonGroup5_i();
            _FindBackPanel_RadioButtonGroup6_i();
            _FindBackPanel_RadioButtonGroup7_i();
            this.addEventListener("creationComplete", ___FindBackPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            FindBackPanel._watcherSetupUtil = _arg_1;
        }


        public function __radiogroup7_change(_arg_1:Event):void
        {
            selectExpType(7);
        }

        public function __btnFind1_click(_arg_1:MouseEvent):void
        {
            findBack(1);
        }

        private function _FindBackPanel_RadioButtonGroup6_i():RadioButtonGroup
        {
            var _local_1:RadioButtonGroup = new RadioButtonGroup();
            radiogroup6 = _local_1;
            _local_1.addEventListener("change", __radiogroup6_change);
            _local_1.initialized(this, "radiogroup6");
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get label12():Label
        {
            return (this._63203307label12);
        }

        private function _FindBackPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.FINDBACK_PANEL_U[0];
            _local_1 = Language.FINDBACK_PANEL_U[1];
            _local_1 = ResManager.getIconUrl(4130220000001);
            _local_1 = Language.FINDBACK_PANEL_U[7];
            _local_1 = Language.FINDBACK_PANEL_U[8];
            _local_1 = Language.FINDBACK_PANEL_U[20];
            _local_1 = Language.FINDBACK_PANEL_U[19];
            _local_1 = Language.FINDBACK_PANEL_U[2];
            _local_1 = ResManager.getIconUrl(4130220000004);
            _local_1 = Language.FINDBACK_PANEL_U[9];
            _local_1 = Language.FINDBACK_PANEL_U[10];
            _local_1 = Language.FINDBACK_PANEL_U[20];
            _local_1 = Language.FINDBACK_PANEL_U[19];
            _local_1 = Language.FINDBACK_PANEL_U[3];
            _local_1 = ResManager.getIconUrl(4130220000012);
            _local_1 = Language.FINDBACK_PANEL_U[11];
            _local_1 = Language.FINDBACK_PANEL_U[12];
            _local_1 = Language.FINDBACK_PANEL_U[20];
            _local_1 = Language.FINDBACK_PANEL_U[19];
            _local_1 = Language.FINDBACK_PANEL_U[4];
            _local_1 = ResManager.getIconUrl(4130220000002);
            _local_1 = Language.FINDBACK_PANEL_U[13];
            _local_1 = Language.FINDBACK_PANEL_U[14];
            _local_1 = Language.FINDBACK_PANEL_U[20];
            _local_1 = Language.FINDBACK_PANEL_U[19];
            _local_1 = Language.FINDBACK_PANEL_U[5];
            _local_1 = ResManager.getIconUrl(4130220000003);
            _local_1 = Language.FINDBACK_PANEL_U[15];
            _local_1 = Language.FINDBACK_PANEL_U[16];
            _local_1 = Language.FINDBACK_PANEL_U[20];
            _local_1 = Language.FINDBACK_PANEL_U[19];
            _local_1 = Language.FINDBACK_PANEL_U[6];
            _local_1 = ResManager.getIconUrl(4130220000006);
            _local_1 = Language.FINDBACK_PANEL_U[17];
            _local_1 = Language.FINDBACK_PANEL_U[18];
            _local_1 = Language.FINDBACK_PANEL_U[21];
            _local_1 = Language.FINDBACK_PANEL_U[20];
            _local_1 = Language.FINDBACK_PANEL_U[6];
            _local_1 = ResManager.getIconUrl(4130220000006);
            _local_1 = Language.FINDBACK_PANEL_U[17];
            _local_1 = Language.FINDBACK_PANEL_U[18];
            _local_1 = Language.FINDBACK_PANEL_U[22];
            _local_1 = Language.FINDBACK_PANEL_U[20];
        }

        [Bindable(event="propertyChange")]
        public function get label11():Label
        {
            return (this._63203308label11);
        }

        public function set label11(_arg_1:Label):void
        {
            var _local_2:Object = this._63203308label11;
            if (_local_2 !== _arg_1)
            {
                this._63203308label11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "label11", _local_2, _arg_1));
            };
        }

        public function set label12(_arg_1:Label):void
        {
            var _local_2:Object = this._63203307label12;
            if (_local_2 !== _arg_1)
            {
                this._63203307label12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "label12", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get label22():Label
        {
            return (this._63203276label22);
        }

        [Bindable(event="propertyChange")]
        public function get label21():Label
        {
            return (this._63203277label21);
        }

        public function resetVB():void
        {
            vb_quest.removeAllChildren();
        }

        public function __radiogroup5_change(_arg_1:Event):void
        {
            selectExpType(5);
        }

        public function __btnFind6_click(_arg_1:MouseEvent):void
        {
            findBack(6);
        }

        public function findBack(_arg_1:int):void
        {
            var _local_2:Number;
            var _local_3:Number;
            var _local_4:Number;
            var _local_5:int;
            switch (_arg_1)
            {
                case 1:
                    _local_2 = Math.ceil((findBackNumArr[0] * basicMoneyCostArr[0]));
                    _local_3 = Math.ceil((findBackNumArr[0] * basicCostArr[0]));
                    if (_core.player.level < 70)
                    {
                        return;
                    };
                    if (findBackExpType1 == 1)
                    {
                        if (!_core.player.enoughMoney("money", _local_2))
                        {
                            _core.sysMidNote(Language.GUILDCONTRIBPANEL_U[2]);
                            return;
                        };
                    }
                    else
                    {
                        if (findBackExpType1 == 2)
                        {
                            if (!_core.player.enoughMoney("gold", _local_3))
                            {
                                _core.sysMidNote(Language.GUILDCONTRIBPANEL_U[1]);
                                return;
                            };
                        };
                    };
                    _core.remote.call("findBackXiuXing", new Responder(onFind), findBackExpType1);
                    return;
                case 2:
                    _local_2 = Math.ceil((findBackNumArr[1] * basicMoneyCostArr[1]));
                    _local_3 = Math.ceil((findBackNumArr[1] * basicCostArr[1]));
                    if (findBackExpType2 == 1)
                    {
                        if (!_core.player.enoughMoney("money", _local_2))
                        {
                            _core.sysMidNote(Language.GUILDCONTRIBPANEL_U[2]);
                            return;
                        };
                    }
                    else
                    {
                        if (findBackExpType2 == 2)
                        {
                            if (!_core.player.enoughMoney("gold", _local_3))
                            {
                                _core.sysMidNote(Language.GUILDCONTRIBPANEL_U[1]);
                                return;
                            };
                        };
                    };
                    _core.remote.call("findBackXueYuan", new Responder(onFind), findBackExpType2);
                    return;
                case 3:
                    if (!_core.battlePet)
                    {
                        _core.sysMidNote(Language.FINDBACK_PANEL_U[36]);
                        return;
                    };
                    if (Number(_core.battlePet.level) >= Number((Number(_core.player.level) + 5)))
                    {
                        _core.sysMidNote(Language.FINDBACK_PANEL_U[39]);
                        return;
                    };
                    _local_2 = Math.ceil((findBackNumArr[2] * basicMoneyCostArr[2]));
                    _local_3 = Math.ceil((findBackNumArr[2] * basicCostArr[2]));
                    if (findBackExpType3 == 1)
                    {
                        if (!_core.player.enoughMoney("money", _local_2))
                        {
                            _core.sysMidNote(Language.GUILDCONTRIBPANEL_U[2]);
                            return;
                        };
                    }
                    else
                    {
                        if (findBackExpType3 == 2)
                        {
                            if (!_core.player.enoughMoney("gold", _local_3))
                            {
                                _core.sysMidNote(Language.GUILDCONTRIBPANEL_U[1]);
                                return;
                            };
                        };
                    };
                    _core.remote.call("findBackChongWu", new Responder(onFind), findBackExpType3);
                    return;
                case 4:
                    _local_2 = Math.ceil((findBackNumArr[3] * basicMoneyCostArr[3]));
                    _local_3 = Math.ceil((findBackNumArr[3] * basicCostArr[3]));
                    if (findBackExpType4 == 1)
                    {
                        if (!_core.player.enoughMoney("money", _local_2))
                        {
                            _core.sysMidNote(Language.GUILDCONTRIBPANEL_U[2]);
                            return;
                        };
                    }
                    else
                    {
                        if (findBackExpType4 == 2)
                        {
                            if (!_core.player.enoughMoney("gold", _local_3))
                            {
                                _core.sysMidNote(Language.GUILDCONTRIBPANEL_U[1]);
                                return;
                            };
                        };
                    };
                    _core.remote.call("findBackPanJun", new Responder(onFind), findBackExpType4);
                    return;
                case 5:
                    _local_2 = Math.ceil((findBackNumArr[4] * basicMoneyCostArr[4]));
                    _local_3 = Math.ceil((findBackNumArr[4] * basicCostArr[4]));
                    if (findBackExpType5 == 1)
                    {
                        if (!_core.player.enoughMoney("money", _local_2))
                        {
                            _core.sysMidNote(Language.GUILDCONTRIBPANEL_U[2]);
                            return;
                        };
                    }
                    else
                    {
                        if (findBackExpType5 == 2)
                        {
                            if (!_core.player.enoughMoney("gold", _local_3))
                            {
                                _core.sysMidNote(Language.GUILDCONTRIBPANEL_U[1]);
                                return;
                            };
                        };
                    };
                    _core.remote.call("findBackFeiMo", new Responder(onFind), findBackExpType5);
                    return;
                case 6:
                    _core.remote.call("findBackXuanShangFree", new Responder(onFind), findBackExpType6);
                    return;
                case 7:
                    _local_4 = refreshBanner.selectedItem.color;
                    if (_local_4 == -1)
                    {
                        _core.sysMsg(Language.FINDBACK_PANEL_U[29]);
                        return;
                    };
                    _local_5 = _core.getItemNumFromBag(GamePredef.TBL_ITEM_TEMPLATE, bannerIds[_local_4]).num;
                    if (_local_5 <= 0)
                    {
                        _core.sysMsg(Language.FINDBACK_PANEL_U[35]);
                        return;
                    };
                    _local_2 = Math.ceil(basicMoneyCostArr[6]);
                    _local_3 = Math.ceil(basicCostArr[6]);
                    if (findBackExpType7 == 1)
                    {
                        if (!_core.player.enoughMoney("money", _local_2))
                        {
                            _core.sysMidNote(Language.GUILDCONTRIBPANEL_U[2]);
                            return;
                        };
                    }
                    else
                    {
                        if (findBackExpType7 == 2)
                        {
                            if (!_core.player.enoughMoney("gold", _local_3))
                            {
                                _core.sysMidNote(Language.GUILDCONTRIBPANEL_U[1]);
                                return;
                            };
                        };
                    };
                    _core.remote.call("findBackXuanShangByBanner", new Responder(onFind), findBackExpType7, _local_4);
                    return;
            };
        }

        [Bindable(event="propertyChange")]
        public function get label31():Label
        {
            return (this._63203246label31);
        }

        private function _FindBackPanel_RadioButtonGroup5_i():RadioButtonGroup
        {
            var _local_1:RadioButtonGroup = new RadioButtonGroup();
            radiogroup5 = _local_1;
            _local_1.addEventListener("change", __radiogroup5_change);
            _local_1.initialized(this, "radiogroup5");
            return (_local_1);
        }

        public function selectExpType(_arg_1:int):void
        {
            if (this.visible)
            {
                switch (_arg_1)
                {
                    case 1:
                        findBackExpType1 = uint(radiogroup1.selectedValue);
                    case 2:
                        findBackExpType2 = uint(radiogroup2.selectedValue);
                    case 3:
                        findBackExpType3 = uint(radiogroup3.selectedValue);
                    case 4:
                        findBackExpType4 = uint(radiogroup4.selectedValue);
                    case 5:
                        findBackExpType5 = uint(radiogroup5.selectedValue);
                    case 6:
                        findBackExpType6 = uint(radiogroup6.selectedValue);
                    case 7:
                        findBackExpType7 = uint(radiogroup7.selectedValue);
                };
            };
        }

        public function onFind(_arg_1:Object):*
        {
            var _local_7:String;
            if (!_arg_1)
            {
                return;
            };
            var _local_2:int = _arg_1.type;
            var _local_3:int = _arg_1.num;
            var _local_4:String = Language.FINDBACK_PANEL_U[19].toString();
            var _local_5:int = _arg_1.exp;
            if (_local_2 != 6)
            {
                if (this[("Canvas" + _local_2)].parent)
                {
                    vb_quest.removeChild(this[("Canvas" + _local_2)]);
                };
            }
            else
            {
                if (this[("Canvas" + _local_2)].parent)
                {
                    vb_quest.removeChild(this[("Canvas" + _local_2)]);
                };
                if (this["Canvas7"].parent)
                {
                    vb_quest.removeChild(this["Canvas7"]);
                };
                xuanshangRefreshNum = _arg_1.refresh;
                xuanshangColor = _arg_1.color;
                xuanshangNum = _local_3;
                xuanshangExp = _local_5;
                if (_local_3 < 10)
                {
                    vb_quest.addChild(this["Canvas6"]);
                    findBackNumArr[5] = (10 - xuanshangNum);
                }
                else
                {
                    if (((_local_3 == 10) && (xuanshangRefreshNum < 4)))
                    {
                        vb_quest.addChild(this["Canvas7"]);
                        findBackNumArr[6] = 10;
                        _local_7 = "";
                        if (xuanshangColor == 5)
                        {
                            _local_7 = Language.FINDBACK_PANEL_U[41];
                        }
                        else
                        {
                            _local_7 = Language.FINDBACK_PANEL_U[(30 + xuanshangColor)];
                        };
                        this[("label" + 7)].htmlText = Language.FINDBACK_PANEL_U[22].toString().replace("{num}", (4 - xuanshangRefreshNum)).replace("{exp}", (_local_5 * awardNum[xuanshangColor])).replace("{color}", _local_7);
                    };
                };
            };
            var _local_6:int;
            while (_local_6 < 7)
            {
                if (this[("Canvas" + (_local_6 + 1))].parent)
                {
                    if (_local_6 < 5)
                    {
                        this[(("label" + (_local_6 + 1)) + "1")].htmlText = Language.FINDBACK_PANEL_U[(7 + (_local_6 * 2))].toString().replace("{num}", Math.ceil((findBackNumArr[_local_6] * basicMoneyCostArr[_local_6])));
                        this[(("label" + (_local_6 + 1)) + "2")].htmlText = Language.FINDBACK_PANEL_U[(8 + (_local_6 * 2))].toString().replace("{num}", Math.ceil((findBackNumArr[_local_6] * basicCostArr[_local_6])));
                    }
                    else
                    {
                        this[(("label" + (_local_6 + 1)) + "1")].htmlText = Language.FINDBACK_PANEL_U[17].toString().replace("{num}", Math.ceil(basicMoneyCostArr[_local_6]));
                        this[(("label" + (_local_6 + 1)) + "2")].htmlText = Language.FINDBACK_PANEL_U[18].toString().replace("{num}", Math.ceil(basicCostArr[_local_6]));
                    };
                };
                _local_6++;
            };
            resetPetMoney();
        }

        public function set label21(_arg_1:Label):void
        {
            var _local_2:Object = this._63203277label21;
            if (_local_2 !== _arg_1)
            {
                this._63203277label21 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "label21", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get label32():Label
        {
            return (this._63203245label32);
        }

        public function set label22(_arg_1:Label):void
        {
            var _local_2:Object = this._63203276label22;
            if (_local_2 !== _arg_1)
            {
                this._63203276label22 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "label22", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get label41():Label
        {
            return (this._63203215label41);
        }

        [Bindable(event="propertyChange")]
        public function get label42():Label
        {
            return (this._63203214label42);
        }

        public function __btnFind3_click(_arg_1:MouseEvent):void
        {
            findBack(3);
        }

        public function __radiogroup3_change(_arg_1:Event):void
        {
            selectExpType(3);
        }

        public function setFindBackInfo(_arg_1:Object):void
        {
            var _local_7:int;
            var _local_8:Number;
            var _local_9:String;
            var _local_10:String;
            if ((((!(_arg_1)) || (!(_arg_1.num))) || (!(_arg_1.exp))))
            {
                return;
            };
            var _local_2:Object = _arg_1.num;
            var _local_3:Object = _arg_1.exp;
            var _local_4:Array = new Array();
            var _local_5:Array = new Array();
            var _local_6:Boolean = true;
            xuanshangExp = ((_arg_1["exp"]["xuanshang"]) ? Number(_arg_1["exp"]["xuanshang"]) : 0);
            _local_7 = 0;
            while (_local_7 < 5)
            {
                _local_8 = 0;
                if (((_local_7 == 0) && (_core.player.level < 70)))
                {
                    _local_8 = GamePredef.FINDBACK_TYPE_XIUXING_NUM;
                    _local_5[_local_7] = 0;
                }
                else
                {
                    _local_8 = Number(_local_2[GamePredef.FINDBACK_TYPES[_local_7]]);
                    _local_5[_local_7] = Number(_local_3[GamePredef.FINDBACK_TYPES[_local_7]]);
                };
                switch (_local_7)
                {
                    case 0:
                        _local_4[0] = (GamePredef.FINDBACK_TYPE_XIUXING_NUM - _local_8);
                        break;
                    case 1:
                        _local_4[1] = (GamePredef.FINDBACK_TYPE_XUEYUAN_NUM - _local_8);
                        break;
                    case 2:
                        _local_4[2] = (GamePredef.FINDBACK_TYPE_CHONGWU_NUM - _local_8);
                        break;
                    case 3:
                        _local_4[3] = (GamePredef.FINDBACK_TYPE_PANJUN_NUM - _local_8);
                        break;
                    case 4:
                        _local_4[4] = (GamePredef.FINDBACK_TYPE_FEIMO_NUM - _local_8);
                        break;
                };
                findBackNumArr[_local_7] = _local_4[_local_7];
                if (_local_4[_local_7] > 0)
                {
                    _local_6 = false;
                };
                _local_7++;
            };
            _local_5[5] = Number(_local_3[GamePredef.FINDBACK_TYPES[5]]);
            xuanshangNum = Number(_local_2["xuanshang_num"]);
            xuanshangRefreshNum = Number(_local_2["xuanshang_refresh"]);
            xuanshangColor = Number(_local_2["xuanshang_color"]);
            if (!((xuanshangNum == 10) && (xuanshangRefreshNum == 4)))
            {
                _local_6 = false;
            };
            if (_local_6)
            {
                Alert.show(Language.FINDBACK_PANEL_U[38]);
                this.visible = false;
                return;
            };
            resetVB();
            _local_7 = 0;
            while (_local_7 < 5)
            {
                if (_local_4[_local_7] > 0)
                {
                    vb_quest.addChild(this[("Canvas" + (_local_7 + 1))]);
                    this[("btnFind" + (_local_7 + 1))].enabled = true;
                    if (((_local_7 == 0) && (_core.player.level < 70)))
                    {
                        if (this[("Canvas" + (_local_7 + 1))].parent)
                        {
                            vb_quest.removeChild(this[("Canvas" + (_local_7 + 1))]);
                        };
                    };
                }
                else
                {
                    if (this[("Canvas" + (_local_7 + 1))].parent)
                    {
                        vb_quest.removeChild(this[("Canvas" + (_local_7 + 1))]);
                    };
                };
                _local_7++;
            };
            _local_7 = 0;
            while (_local_7 < 5)
            {
                _local_10 = Language.FINDBACK_PANEL_U[19].toString();
                this[("label" + (_local_7 + 1))].htmlText = _local_10.replace("{num}", _local_4[_local_7]).replace("{exp}", Math.floor(_local_5[_local_7]));
                _local_7++;
            };
            _local_9 = "";
            if (xuanshangColor == 5)
            {
                _local_9 = Language.FINDBACK_PANEL_U[41];
            }
            else
            {
                _local_9 = Language.FINDBACK_PANEL_U[(30 + xuanshangColor)];
            };
            if (xuanshangNum < 10)
            {
                vb_quest.addChild(this["Canvas6"]);
                this["label6"].htmlText = Language.FINDBACK_PANEL_U[21].toString().replace("{num}", (10 - xuanshangNum)).replace("{exp}", Math.floor((_local_5[5] * awardNum[xuanshangColor]))).replace("{color}", _local_9);
                findBackNumArr[5] = (10 - xuanshangNum);
            }
            else
            {
                if (xuanshangNum == 10)
                {
                    if (xuanshangRefreshNum < 4)
                    {
                        vb_quest.addChild(this["Canvas7"]);
                        this["label7"].htmlText = Language.FINDBACK_PANEL_U[22].toString().replace("{num}", (4 - xuanshangRefreshNum)).replace("{exp}", Math.floor((_local_5[5] * awardNum[xuanshangColor]))).replace("{color}", _local_9);
                        selectBanner(false);
                        refreshBanner.selectedIndex = (xuanshangColor + 1);
                        findBackNumArr[6] = 10;
                    };
                };
            };
            _local_7 = 0;
            while (_local_7 < 7)
            {
                if (this[("Canvas" + (_local_7 + 1))].parent)
                {
                    if (_local_7 < 5)
                    {
                        this[(("label" + (_local_7 + 1)) + "1")].htmlText = Language.FINDBACK_PANEL_U[(7 + (_local_7 * 2))].toString().replace("{num}", Math.ceil((findBackNumArr[_local_7] * basicMoneyCostArr[_local_7])));
                        this[(("label" + (_local_7 + 1)) + "2")].htmlText = Language.FINDBACK_PANEL_U[(8 + (_local_7 * 2))].toString().replace("{num}", Math.ceil((findBackNumArr[_local_7] * basicCostArr[_local_7])));
                    }
                    else
                    {
                        this[(("label" + (_local_7 + 1)) + "1")].htmlText = Language.FINDBACK_PANEL_U[17].toString().replace("{num}", Math.ceil(basicMoneyCostArr[_local_7]));
                        this[(("label" + (_local_7 + 1)) + "2")].htmlText = Language.FINDBACK_PANEL_U[18].toString().replace("{num}", Math.ceil(basicCostArr[_local_7]));
                    };
                };
                _local_7++;
            };
            resetPetMoney();
        }

        [Bindable(event="propertyChange")]
        public function get label52():Label
        {
            return (this._63203183label52);
        }

        private function _FindBackPanel_RadioButtonGroup4_i():RadioButtonGroup
        {
            var _local_1:RadioButtonGroup = new RadioButtonGroup();
            radiogroup4 = _local_1;
            _local_1.addEventListener("change", __radiogroup4_change);
            _local_1.initialized(this, "radiogroup4");
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get label51():Label
        {
            return (this._63203184label51);
        }

        public function set radiogroup1(_arg_1:RadioButtonGroup):void
        {
            var _local_2:Object = this._164873549radiogroup1;
            if (_local_2 !== _arg_1)
            {
                this._164873549radiogroup1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "radiogroup1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get btnFind2():DelayButton
        {
            return (this._2085022877btnFind2);
        }

        [Bindable(event="propertyChange")]
        public function get btnFind4():DelayButton
        {
            return (this._2085022879btnFind4);
        }

        [Bindable(event="propertyChange")]
        public function get btnFind6():DelayButton
        {
            return (this._2085022881btnFind6);
        }

        [Bindable(event="propertyChange")]
        public function get btnFind1():DelayButton
        {
            return (this._2085022876btnFind1);
        }

        public function set label31(_arg_1:Label):void
        {
            var _local_2:Object = this._63203246label31;
            if (_local_2 !== _arg_1)
            {
                this._63203246label31 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "label31", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get btnFind3():DelayButton
        {
            return (this._2085022878btnFind3);
        }

        [Bindable(event="propertyChange")]
        public function get btnFind5():DelayButton
        {
            return (this._2085022880btnFind5);
        }

        [Bindable(event="propertyChange")]
        public function get btnFind7():DelayButton
        {
            return (this._2085022882btnFind7);
        }

        [Bindable(event="propertyChange")]
        public function get label61():Label
        {
            return (this._63203153label61);
        }

        [Bindable(event="propertyChange")]
        public function get label62():Label
        {
            return (this._63203152label62);
        }

        public function set radiogroup5(_arg_1:RadioButtonGroup):void
        {
            var _local_2:Object = this._164873553radiogroup5;
            if (_local_2 !== _arg_1)
            {
                this._164873553radiogroup5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "radiogroup5", _local_2, _arg_1));
            };
        }

        public function set radiogroup6(_arg_1:RadioButtonGroup):void
        {
            var _local_2:Object = this._164873554radiogroup6;
            if (_local_2 !== _arg_1)
            {
                this._164873554radiogroup6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "radiogroup6", _local_2, _arg_1));
            };
        }

        public function set radiogroup2(_arg_1:RadioButtonGroup):void
        {
            var _local_2:Object = this._164873550radiogroup2;
            if (_local_2 !== _arg_1)
            {
                this._164873550radiogroup2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "radiogroup2", _local_2, _arg_1));
            };
        }

        public function set label32(_arg_1:Label):void
        {
            var _local_2:Object = this._63203245label32;
            if (_local_2 !== _arg_1)
            {
                this._63203245label32 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "label32", _local_2, _arg_1));
            };
        }

        public function set radiogroup4(_arg_1:RadioButtonGroup):void
        {
            var _local_2:Object = this._164873552radiogroup4;
            if (_local_2 !== _arg_1)
            {
                this._164873552radiogroup4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "radiogroup4", _local_2, _arg_1));
            };
        }

        public function __radiogroup1_change(_arg_1:Event):void
        {
            selectExpType(1);
        }

        [Bindable(event="propertyChange")]
        public function get img1():Image
        {
            return (this._3236046img1);
        }

        [Bindable(event="propertyChange")]
        public function get img2():Image
        {
            return (this._3236047img2);
        }

        [Bindable(event="propertyChange")]
        public function get img5():Image
        {
            return (this._3236050img5);
        }

        [Bindable(event="propertyChange")]
        public function get img6():Image
        {
            return (this._3236051img6);
        }

        [Bindable(event="propertyChange")]
        public function get img7():Image
        {
            return (this._3236052img7);
        }

        [Bindable(event="propertyChange")]
        public function get label71():Label
        {
            return (this._63203122label71);
        }

        [Bindable(event="propertyChange")]
        public function get label72():Label
        {
            return (this._63203121label72);
        }

        [Bindable(event="propertyChange")]
        public function get img3():Image
        {
            return (this._3236048img3);
        }

        private function _FindBackPanel_RadioButtonGroup3_i():RadioButtonGroup
        {
            var _local_1:RadioButtonGroup = new RadioButtonGroup();
            radiogroup3 = _local_1;
            _local_1.addEventListener("change", __radiogroup3_change);
            _local_1.initialized(this, "radiogroup3");
            return (_local_1);
        }

        public function set radiogroup7(_arg_1:RadioButtonGroup):void
        {
            var _local_2:Object = this._164873555radiogroup7;
            if (_local_2 !== _arg_1)
            {
                this._164873555radiogroup7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "radiogroup7", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get img4():Image
        {
            return (this._3236049img4);
        }

        public function set label41(_arg_1:Label):void
        {
            var _local_2:Object = this._63203215label41;
            if (_local_2 !== _arg_1)
            {
                this._63203215label41 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "label41", _local_2, _arg_1));
            };
        }

        override public function set visible(_arg_1:Boolean):void
        {
            if (((_arg_1) && (_core.player.level < 50)))
            {
                Alert.show(Language.FINDBACK_PANEL_U[37]);
                return;
            };
            super.visible = _arg_1;
            if (_arg_1)
            {
                _core.remote.call("getFindBackData", new Responder(setFindBackInfo));
            };
        }

        public function __refreshBanner_change(_arg_1:ListEvent):void
        {
            selectBanner(true);
        }

        public function set radiogroup3(_arg_1:RadioButtonGroup):void
        {
            var _local_2:Object = this._164873551radiogroup3;
            if (_local_2 !== _arg_1)
            {
                this._164873551radiogroup3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "radiogroup3", _local_2, _arg_1));
            };
        }

        public function set label42(_arg_1:Label):void
        {
            var _local_2:Object = this._63203214label42;
            if (_local_2 !== _arg_1)
            {
                this._63203214label42 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "label42", _local_2, _arg_1));
            };
        }

        public function showPanel():void
        {
            if (_core.player.level < 50)
            {
                Alert.show(Language.FINDBACK_PANEL_U[37]);
                return;
            };
            this.visible = true;
        }

        public function __btnFind5_click(_arg_1:MouseEvent):void
        {
            findBack(5);
        }

        private function _FindBackPanel_RadioButtonGroup2_i():RadioButtonGroup
        {
            var _local_1:RadioButtonGroup = new RadioButtonGroup();
            radiogroup2 = _local_1;
            _local_1.addEventListener("change", __radiogroup2_change);
            _local_1.initialized(this, "radiogroup2");
            return (_local_1);
        }

        public function __radiogroup6_change(_arg_1:Event):void
        {
            selectExpType(6);
        }

        public function set vb_quest(_arg_1:VBox):void
        {
            var _local_2:Object = this._898049649vb_quest;
            if (_local_2 !== _arg_1)
            {
                this._898049649vb_quest = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vb_quest", _local_2, _arg_1));
            };
        }

        public function set label52(_arg_1:Label):void
        {
            var _local_2:Object = this._63203183label52;
            if (_local_2 !== _arg_1)
            {
                this._63203183label52 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "label52", _local_2, _arg_1));
            };
        }

        public function set label51(_arg_1:Label):void
        {
            var _local_2:Object = this._63203184label51;
            if (_local_2 !== _arg_1)
            {
                this._63203184label51 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "label51", _local_2, _arg_1));
            };
        }

        public function set btnFind2(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._2085022877btnFind2;
            if (_local_2 !== _arg_1)
            {
                this._2085022877btnFind2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnFind2", _local_2, _arg_1));
            };
        }

        public function set btnFind4(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._2085022879btnFind4;
            if (_local_2 !== _arg_1)
            {
                this._2085022879btnFind4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnFind4", _local_2, _arg_1));
            };
        }

        public function set btnFind1(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._2085022876btnFind1;
            if (_local_2 !== _arg_1)
            {
                this._2085022876btnFind1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnFind1", _local_2, _arg_1));
            };
        }

        public function set btnFind5(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._2085022880btnFind5;
            if (_local_2 !== _arg_1)
            {
                this._2085022880btnFind5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnFind5", _local_2, _arg_1));
            };
        }

        private function selectBanner(_arg_1:Boolean):void
        {
            if (refreshBanner.selectedIndex == 0)
            {
                return;
            };
            var _local_2:int = _core.getItemNumFromBag(GamePredef.TBL_ITEM_TEMPLATE, bannerIds[(refreshBanner.selectedIndex - 1)]).num;
            if (_local_2 == 0)
            {
                if (_arg_1)
                {
                    Alert.show(Language.FINDBACK_PANEL_U[35]);
                };
                btnFind7.enabled = false;
            }
            else
            {
                btnFind7.enabled = true;
            };
            var _local_3:* = "";
            if (refreshBanner.selectedIndex == 6)
            {
                _local_3 = Language.FINDBACK_PANEL_U[41];
            }
            else
            {
                _local_3 = Language.FINDBACK_PANEL_U[((30 + refreshBanner.selectedIndex) - 1)];
            };
            this[("label" + 7)].htmlText = Language.FINDBACK_PANEL_U[22].toString().replace("{num}", (4 - xuanshangRefreshNum)).replace("{exp}", (xuanshangExp * awardNum[(refreshBanner.selectedIndex - 1)])).replace("{color}", _local_3);
            this["label71"].htmlText = Language.FINDBACK_PANEL_U[17].toString().replace("{num}", Math.ceil(basicMoneyCostArr[6]));
            this["label72"].htmlText = Language.FINDBACK_PANEL_U[18].toString().replace("{num}", Math.ceil(basicCostArr[6]));
        }

        public function set btnFind6(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._2085022881btnFind6;
            if (_local_2 !== _arg_1)
            {
                this._2085022881btnFind6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnFind6", _local_2, _arg_1));
            };
        }

        public function set btnFind3(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._2085022878btnFind3;
            if (_local_2 !== _arg_1)
            {
                this._2085022878btnFind3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnFind3", _local_2, _arg_1));
            };
        }

        public function ___FindBackPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initView();
        }

        [Bindable(event="propertyChange")]
        public function get radiogroup2():RadioButtonGroup
        {
            return (this._164873550radiogroup2);
        }

        private function _FindBackPanel_RadioButtonGroup1_i():RadioButtonGroup
        {
            var _local_1:RadioButtonGroup = new RadioButtonGroup();
            radiogroup1 = _local_1;
            _local_1.addEventListener("change", __radiogroup1_change);
            _local_1.initialized(this, "radiogroup1");
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get radiogroup5():RadioButtonGroup
        {
            return (this._164873553radiogroup5);
        }

        [Bindable(event="propertyChange")]
        public function get radiogroup6():RadioButtonGroup
        {
            return (this._164873554radiogroup6);
        }

        [Bindable(event="propertyChange")]
        public function get radiogroup1():RadioButtonGroup
        {
            return (this._164873549radiogroup1);
        }

        [Bindable(event="propertyChange")]
        public function get radiogroup3():RadioButtonGroup
        {
            return (this._164873551radiogroup3);
        }

        public function resetPetMoney():*
        {
            if (Canvas3.parent)
            {
                this["label31"].htmlText = Language.FINDBACK_PANEL_U[11].toString().replace("{num}", Math.ceil((findBackNumArr[2] * basicMoneyCostArr[2])));
            };
        }

        [Bindable(event="propertyChange")]
        public function get radiogroup7():RadioButtonGroup
        {
            return (this._164873555radiogroup7);
        }

        private function _FindBackPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FINDBACK_PANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FindBackPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_FindBackPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FINDBACK_PANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FindBackPanel_Label1.htmlText = _arg_1;
            }, "_FindBackPanel_Label1.htmlText");
            result[1] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000001));
            }, function (_arg_1:Object):void
            {
                img1.source = _arg_1;
            }, "img1.source");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FINDBACK_PANEL_U[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                label11.htmlText = _arg_1;
            }, "label11.htmlText");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FINDBACK_PANEL_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                label12.htmlText = _arg_1;
            }, "label12.htmlText");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FINDBACK_PANEL_U[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnFind1.label = _arg_1;
            }, "btnFind1.label");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FINDBACK_PANEL_U[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                label1.htmlText = _arg_1;
            }, "label1.htmlText");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FINDBACK_PANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FindBackPanel_Label5.htmlText = _arg_1;
            }, "_FindBackPanel_Label5.htmlText");
            result[7] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000004));
            }, function (_arg_1:Object):void
            {
                img2.source = _arg_1;
            }, "img2.source");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FINDBACK_PANEL_U[9];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                label21.htmlText = _arg_1;
            }, "label21.htmlText");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FINDBACK_PANEL_U[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                label22.htmlText = _arg_1;
            }, "label22.htmlText");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FINDBACK_PANEL_U[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnFind2.label = _arg_1;
            }, "btnFind2.label");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FINDBACK_PANEL_U[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                label2.htmlText = _arg_1;
            }, "label2.htmlText");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FINDBACK_PANEL_U[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FindBackPanel_Label9.htmlText = _arg_1;
            }, "_FindBackPanel_Label9.htmlText");
            result[13] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000012));
            }, function (_arg_1:Object):void
            {
                img3.source = _arg_1;
            }, "img3.source");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FINDBACK_PANEL_U[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                label31.htmlText = _arg_1;
            }, "label31.htmlText");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FINDBACK_PANEL_U[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                label32.htmlText = _arg_1;
            }, "label32.htmlText");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FINDBACK_PANEL_U[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnFind3.label = _arg_1;
            }, "btnFind3.label");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FINDBACK_PANEL_U[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                label3.htmlText = _arg_1;
            }, "label3.htmlText");
            result[18] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FINDBACK_PANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FindBackPanel_Label13.htmlText = _arg_1;
            }, "_FindBackPanel_Label13.htmlText");
            result[19] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000002));
            }, function (_arg_1:Object):void
            {
                img4.source = _arg_1;
            }, "img4.source");
            result[20] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FINDBACK_PANEL_U[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                label41.htmlText = _arg_1;
            }, "label41.htmlText");
            result[21] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FINDBACK_PANEL_U[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                label42.htmlText = _arg_1;
            }, "label42.htmlText");
            result[22] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FINDBACK_PANEL_U[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnFind4.label = _arg_1;
            }, "btnFind4.label");
            result[23] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FINDBACK_PANEL_U[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                label4.htmlText = _arg_1;
            }, "label4.htmlText");
            result[24] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FINDBACK_PANEL_U[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FindBackPanel_Label17.htmlText = _arg_1;
            }, "_FindBackPanel_Label17.htmlText");
            result[25] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000003));
            }, function (_arg_1:Object):void
            {
                img5.source = _arg_1;
            }, "img5.source");
            result[26] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FINDBACK_PANEL_U[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                label51.htmlText = _arg_1;
            }, "label51.htmlText");
            result[27] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FINDBACK_PANEL_U[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                label52.htmlText = _arg_1;
            }, "label52.htmlText");
            result[28] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FINDBACK_PANEL_U[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnFind5.label = _arg_1;
            }, "btnFind5.label");
            result[29] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FINDBACK_PANEL_U[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                label5.htmlText = _arg_1;
            }, "label5.htmlText");
            result[30] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FINDBACK_PANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FindBackPanel_Label21.htmlText = _arg_1;
            }, "_FindBackPanel_Label21.htmlText");
            result[31] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000006));
            }, function (_arg_1:Object):void
            {
                img6.source = _arg_1;
            }, "img6.source");
            result[32] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FINDBACK_PANEL_U[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                label61.htmlText = _arg_1;
            }, "label61.htmlText");
            result[33] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FINDBACK_PANEL_U[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                label62.htmlText = _arg_1;
            }, "label62.htmlText");
            result[34] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FINDBACK_PANEL_U[21];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                label6.htmlText = _arg_1;
            }, "label6.htmlText");
            result[35] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FINDBACK_PANEL_U[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnFind6.label = _arg_1;
            }, "btnFind6.label");
            result[36] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FINDBACK_PANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _FindBackPanel_Label25.htmlText = _arg_1;
            }, "_FindBackPanel_Label25.htmlText");
            result[37] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000006));
            }, function (_arg_1:Object):void
            {
                img7.source = _arg_1;
            }, "img7.source");
            result[38] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FINDBACK_PANEL_U[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                label71.htmlText = _arg_1;
            }, "label71.htmlText");
            result[39] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FINDBACK_PANEL_U[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                label72.htmlText = _arg_1;
            }, "label72.htmlText");
            result[40] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FINDBACK_PANEL_U[22];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                label7.htmlText = _arg_1;
            }, "label7.htmlText");
            result[41] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.FINDBACK_PANEL_U[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnFind7.label = _arg_1;
            }, "btnFind7.label");
            result[42] = binding;
            return (result);
        }

        public function __btnFind2_click(_arg_1:MouseEvent):void
        {
            findBack(2);
        }

        public function __radiogroup4_change(_arg_1:Event):void
        {
            selectExpType(4);
        }

        public function set label61(_arg_1:Label):void
        {
            var _local_2:Object = this._63203153label61;
            if (_local_2 !== _arg_1)
            {
                this._63203153label61 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "label61", _local_2, _arg_1));
            };
        }

        public function set btnFind7(_arg_1:DelayButton):void
        {
            var _local_2:Object = this._2085022882btnFind7;
            if (_local_2 !== _arg_1)
            {
                this._2085022882btnFind7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnFind7", _local_2, _arg_1));
            };
        }

        public function set label62(_arg_1:Label):void
        {
            var _local_2:Object = this._63203152label62;
            if (_local_2 !== _arg_1)
            {
                this._63203152label62 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "label62", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get radiogroup4():RadioButtonGroup
        {
            return (this._164873552radiogroup4);
        }

        public function set Canvas1(_arg_1:Canvas):void
        {
            var _local_2:Object = this._2079535687Canvas1;
            if (_local_2 !== _arg_1)
            {
                this._2079535687Canvas1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "Canvas1", _local_2, _arg_1));
            };
        }

        public function set Canvas3(_arg_1:Canvas):void
        {
            var _local_2:Object = this._2079535685Canvas3;
            if (_local_2 !== _arg_1)
            {
                this._2079535685Canvas3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "Canvas3", _local_2, _arg_1));
            };
        }

        public function set Canvas4(_arg_1:Canvas):void
        {
            var _local_2:Object = this._2079535684Canvas4;
            if (_local_2 !== _arg_1)
            {
                this._2079535684Canvas4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "Canvas4", _local_2, _arg_1));
            };
        }

        public function set Canvas5(_arg_1:Canvas):void
        {
            var _local_2:Object = this._2079535683Canvas5;
            if (_local_2 !== _arg_1)
            {
                this._2079535683Canvas5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "Canvas5", _local_2, _arg_1));
            };
        }

        public function set Canvas2(_arg_1:Canvas):void
        {
            var _local_2:Object = this._2079535686Canvas2;
            if (_local_2 !== _arg_1)
            {
                this._2079535686Canvas2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "Canvas2", _local_2, _arg_1));
            };
        }

        public function set Canvas7(_arg_1:Canvas):void
        {
            var _local_2:Object = this._2079535681Canvas7;
            if (_local_2 !== _arg_1)
            {
                this._2079535681Canvas7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "Canvas7", _local_2, _arg_1));
            };
        }

        public function set label1(_arg_1:Label):void
        {
            var _local_2:Object = this._1110417475label1;
            if (_local_2 !== _arg_1)
            {
                this._1110417475label1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "label1", _local_2, _arg_1));
            };
        }

        public function set label5(_arg_1:Label):void
        {
            var _local_2:Object = this._1110417471label5;
            if (_local_2 !== _arg_1)
            {
                this._1110417471label5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "label5", _local_2, _arg_1));
            };
        }

        public function set label3(_arg_1:Label):void
        {
            var _local_2:Object = this._1110417473label3;
            if (_local_2 !== _arg_1)
            {
                this._1110417473label3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "label3", _local_2, _arg_1));
            };
        }

        public function set label7(_arg_1:Label):void
        {
            var _local_2:Object = this._1110417469label7;
            if (_local_2 !== _arg_1)
            {
                this._1110417469label7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "label7", _local_2, _arg_1));
            };
        }

        public function set label4(_arg_1:Label):void
        {
            var _local_2:Object = this._1110417472label4;
            if (_local_2 !== _arg_1)
            {
                this._1110417472label4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "label4", _local_2, _arg_1));
            };
        }

        public function __btnFind7_click(_arg_1:MouseEvent):void
        {
            findBack(7);
        }

        [Bindable(event="propertyChange")]
        public function get vb_quest():VBox
        {
            return (this._898049649vb_quest);
        }

        override public function initialize():void
        {
            var target:FindBackPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _FindBackPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_FindBackPanelWatcherSetupUtil");
                var _local_2:* = watcherSetupUtilClass;
                (_local_2["init"](null));
            };
            _watcherSetupUtil.setup(this, function (_arg_1:String):*
            {
                return (target[_arg_1]);
            }, bindings, watchers);
            var i:uint;
            while (i < bindings.length)
            {
                Binding(bindings[i]).execute();
                i++;
            };
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            super.initialize();
        }

        public function set Canvas6(_arg_1:Canvas):void
        {
            var _local_2:Object = this._2079535682Canvas6;
            if (_local_2 !== _arg_1)
            {
                this._2079535682Canvas6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "Canvas6", _local_2, _arg_1));
            };
        }

        public function set img1(_arg_1:Image):void
        {
            var _local_2:Object = this._3236046img1;
            if (_local_2 !== _arg_1)
            {
                this._3236046img1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img1", _local_2, _arg_1));
            };
        }

        public function set img2(_arg_1:Image):void
        {
            var _local_2:Object = this._3236047img2;
            if (_local_2 !== _arg_1)
            {
                this._3236047img2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img2", _local_2, _arg_1));
            };
        }

        public function set img3(_arg_1:Image):void
        {
            var _local_2:Object = this._3236048img3;
            if (_local_2 !== _arg_1)
            {
                this._3236048img3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img3", _local_2, _arg_1));
            };
        }

        public function __radiogroup2_change(_arg_1:Event):void
        {
            selectExpType(2);
        }

        public function set img4(_arg_1:Image):void
        {
            var _local_2:Object = this._3236049img4;
            if (_local_2 !== _arg_1)
            {
                this._3236049img4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img4", _local_2, _arg_1));
            };
        }

        public function set label71(_arg_1:Label):void
        {
            var _local_2:Object = this._63203122label71;
            if (_local_2 !== _arg_1)
            {
                this._63203122label71 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "label71", _local_2, _arg_1));
            };
        }

        public function set label72(_arg_1:Label):void
        {
            var _local_2:Object = this._63203121label72;
            if (_local_2 !== _arg_1)
            {
                this._63203121label72 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "label72", _local_2, _arg_1));
            };
        }

        public function set label2(_arg_1:Label):void
        {
            var _local_2:Object = this._1110417474label2;
            if (_local_2 !== _arg_1)
            {
                this._1110417474label2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "label2", _local_2, _arg_1));
            };
        }

        public function set img5(_arg_1:Image):void
        {
            var _local_2:Object = this._3236050img5;
            if (_local_2 !== _arg_1)
            {
                this._3236050img5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img5", _local_2, _arg_1));
            };
        }

        public function set img6(_arg_1:Image):void
        {
            var _local_2:Object = this._3236051img6;
            if (_local_2 !== _arg_1)
            {
                this._3236051img6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img6", _local_2, _arg_1));
            };
        }

        public function set img7(_arg_1:Image):void
        {
            var _local_2:Object = this._3236052img7;
            if (_local_2 !== _arg_1)
            {
                this._3236052img7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img7", _local_2, _arg_1));
            };
        }

        public function set label6(_arg_1:Label):void
        {
            var _local_2:Object = this._1110417470label6;
            if (_local_2 !== _arg_1)
            {
                this._1110417470label6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "label6", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get Canvas1():Canvas
        {
            return (this._2079535687Canvas1);
        }

        [Bindable(event="propertyChange")]
        public function get Canvas2():Canvas
        {
            return (this._2079535686Canvas2);
        }

        [Bindable(event="propertyChange")]
        public function get Canvas3():Canvas
        {
            return (this._2079535685Canvas3);
        }

        [Bindable(event="propertyChange")]
        public function get Canvas4():Canvas
        {
            return (this._2079535684Canvas4);
        }

        [Bindable(event="propertyChange")]
        public function get Canvas5():Canvas
        {
            return (this._2079535683Canvas5);
        }

        [Bindable(event="propertyChange")]
        public function get Canvas7():Canvas
        {
            return (this._2079535681Canvas7);
        }

        [Bindable(event="propertyChange")]
        public function get label5():Label
        {
            return (this._1110417471label5);
        }

        [Bindable(event="propertyChange")]
        public function get label7():Label
        {
            return (this._1110417469label7);
        }

        [Bindable(event="propertyChange")]
        public function get label3():Label
        {
            return (this._1110417473label3);
        }

        [Bindable(event="propertyChange")]
        public function get label4():Label
        {
            return (this._1110417472label4);
        }

        public function __btnFind4_click(_arg_1:MouseEvent):void
        {
            findBack(4);
        }

        [Bindable(event="propertyChange")]
        public function get label6():Label
        {
            return (this._1110417470label6);
        }

        [Bindable(event="propertyChange")]
        public function get Canvas6():Canvas
        {
            return (this._2079535682Canvas6);
        }

        public function set refreshBanner(_arg_1:ComboBox):void
        {
            var _local_2:Object = this._2015112679refreshBanner;
            if (_local_2 !== _arg_1)
            {
                this._2015112679refreshBanner = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "refreshBanner", _local_2, _arg_1));
            };
        }

        override public function initView():void
        {
            var _local_1:ArrayCollection = new ArrayCollection();
            _local_1.addItem({
                "color":-1,
                "label":Language.FINDBACK_PANEL_U[23]
            });
            _local_1.addItem({
                "color":0,
                "label":Language.FINDBACK_PANEL_U[24]
            });
            _local_1.addItem({
                "color":1,
                "label":Language.FINDBACK_PANEL_U[25]
            });
            _local_1.addItem({
                "color":2,
                "label":Language.FINDBACK_PANEL_U[26]
            });
            _local_1.addItem({
                "color":3,
                "label":Language.FINDBACK_PANEL_U[27]
            });
            _local_1.addItem({
                "color":4,
                "label":Language.FINDBACK_PANEL_U[28]
            });
            _local_1.addItem({
                "color":5,
                "label":Language.FINDBACK_PANEL_U[40]
            });
            refreshBanner.dataProvider = _local_1;
        }

        [Bindable(event="propertyChange")]
        public function get label2():Label
        {
            return (this._1110417474label2);
        }

        private function _FindBackPanel_RadioButtonGroup7_i():RadioButtonGroup
        {
            var _local_1:RadioButtonGroup = new RadioButtonGroup();
            radiogroup7 = _local_1;
            _local_1.addEventListener("change", __radiogroup7_change);
            _local_1.initialized(this, "radiogroup7");
            return (_local_1);
        }

        [Bindable(event="propertyChange")]
        public function get refreshBanner():ComboBox
        {
            return (this._2015112679refreshBanner);
        }

        [Bindable(event="propertyChange")]
        public function get label1():Label
        {
            return (this._1110417475label1);
        }


    }
}//package com.qeedoo.ui.view.compDragable

