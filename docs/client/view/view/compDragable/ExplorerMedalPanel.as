// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.ExplorerMedalPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import mx.controls.Image;
    import mx.controls.Alert;
    import mx.containers.Canvas;
    import mx.controls.LinkButton;
    import com.qeedoo.ui.view.comp.BasicDelayButton;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.core.UIComponentDescriptor;
    import mx.controls.Button;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.ui.utils.ToolKit;
    import com.qeedoo.game.config.Language;
    import flash.net.Responder;
    import com.adobe.crypto.MD5;
    import mx.events.CloseEvent;
    import mx.managers.PopUpManager;
    import com.qeedoo.ui.resource.ResManager;
    import mx.binding.Binding;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.data.GameData;
    import flash.utils.getDefinitionByName;
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

    public class ExplorerMedalPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _272913862EMPropLbl1_3:RoundedLabel;
        private var _1078038500medal3:Image;
        private var _440572518medalLabel7:RoundedLabel;
        public var _ExplorerMedalPanel_RoundedLabel29:RoundedLabel;
        private var _1652929113EMTotalPropLbl1_13:RoundedLabel;
        private var _1078038499medal4:Image;
        private var _3116781embg:Image;
        private var _440572522medalLabel3:RoundedLabel;
        private var _468962284EMTotalPropLbl1_9:RoundedLabel;
        private var _272912899EMPropLbl2_5:RoundedLabel;
        private var _1078038496medal7:Image;
        private var _alert:Alert;
        private var _272912902EMPropLbl2_2:RoundedLabel;
        private var _1652929112EMTotalPropLbl1_14:RoundedLabel;
        private var _468962285EMTotalPropLbl1_8:RoundedLabel;
        private var _1078038502medal1:Image;
        private var _468962286EMTotalPropLbl1_7:RoundedLabel;
        private var _272913863EMPropLbl1_2:RoundedLabel;
        private var _emInfo:Array;
        private var _1652929111EMTotalPropLbl1_15:RoundedLabel;
        private var _468962287EMTotalPropLbl1_6:RoundedLabel;
        private var _440572517medalLabel8:RoundedLabel;
        private var _468962288EMTotalPropLbl1_5:RoundedLabel;
        private var _272912896EMPropLbl2_8:RoundedLabel;
        private var _468962289EMTotalPropLbl1_4:RoundedLabel;
        private var _1652929110EMTotalPropLbl1_16:RoundedLabel;
        private var _1078038498medal5:Image;
        private var _272912903EMPropLbl2_1:RoundedLabel;
        private var _1133593465nextLevelTitle:RoundedLabel;
        private var _272913857EMPropLbl1_8:RoundedLabel;
        private var _440572521medalLabel4:RoundedLabel;
        private var _272913860EMPropLbl1_5:RoundedLabel;
        private var _440572524medalLabel1:RoundedLabel;
        private var _378573758nextLevelCost:RoundedLabel;
        private var _550778329canvas1:Canvas;
        private var _272913864EMPropLbl1_1:RoundedLabel;
        private var _1078038495medal8:Image;
        private var _helpAlert:Alert;
        public var _ExplorerMedalPanel_LinkButton1:LinkButton;
        private var _1078038501medal2:Image;
        private var _1088999281currentEMP:RoundedLabel;
        private var _440572516medalLabel9:RoundedLabel;
        private var _272912897EMPropLbl2_7:RoundedLabel;
        private var _1652929116EMTotalPropLbl1_10:RoundedLabel;
        private var _440572519medalLabel6:RoundedLabel;
        private var _272912900EMPropLbl2_4:RoundedLabel;
        private var _272913858EMPropLbl1_7:RoundedLabel;
        private var _272913861EMPropLbl1_4:RoundedLabel;
        private var _468962290EMTotalPropLbl1_3:RoundedLabel;
        private var _440572520medalLabel5:RoundedLabel;
        private var _1652929115EMTotalPropLbl1_11:RoundedLabel;
        private var _440572523medalLabel2:RoundedLabel;
        private var _468962291EMTotalPropLbl1_2:RoundedLabel;
        private var _1078038497medal6:Image;
        private var _468962292EMTotalPropLbl1_1:RoundedLabel;
        private var _nextLevelCost:int;
        private var _272912898EMPropLbl2_6:RoundedLabel;
        private var _1141243789currentLevelTitle:RoundedLabel;
        public var _ExplorerMedalPanel_BasicDelayButton1:BasicDelayButton;
        public var _ExplorerMedalPanel_BasicDelayButton2:BasicDelayButton;
        private var _1078038494medal9:Image;
        private var _940544854medal10:Image;
        private var _1652929114EMTotalPropLbl1_12:RoundedLabel;
        public var _ExplorerMedalPanel_BasicDelayButton3:BasicDelayButton;
        private var _272912901EMPropLbl2_3:RoundedLabel;
        private var _772846308medalLabel10:RoundedLabel;
        private var _272913859EMPropLbl1_6:RoundedLabel;
        private var _110371416title:BasicTitleCanvas;
        private var _cid:Number = 0;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":700,
                    "height":436,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"title"
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"embg",
                        "stylesFactory":function ():void
                        {
                            this.top = "33";
                            this.left = "5";
                            this.right = "5";
                            this.bottom = "4";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({"scaleContent":true});
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "id":"canvas1",
                        "stylesFactory":function ():void
                        {
                            this.left = "10";
                            this.right = "10";
                            this.top = "40";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "height":120,
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"medal1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":16.5,
                                            "y":19
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"medal2",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":80.5,
                                            "y":19
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"medal3",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":139.5,
                                            "y":19
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"medal4",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":201.5,
                                            "y":19
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"medal5",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":265.5,
                                            "y":19
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"medal6",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":331,
                                            "y":19
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"medal7",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":397.5,
                                            "y":19
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"medal8",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":464.5,
                                            "y":19
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"medal9",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":535.5,
                                            "y":19
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"medal10",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":603.5,
                                            "y":19
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"medalLabel1",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":28.5,
                                            "y":90
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"medalLabel2",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":90.5,
                                            "y":90
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"medalLabel3",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":152.5,
                                            "y":90
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"medalLabel4",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":214.5,
                                            "y":90
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"medalLabel5",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":277.5,
                                            "y":90
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"medalLabel6",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":344,
                                            "y":90
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"medalLabel7",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":409.5,
                                            "y":90
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"medalLabel8",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":477.5,
                                            "y":90
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"medalLabel9",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":548.5,
                                            "y":90
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"medalLabel10",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":616.5,
                                            "y":90
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.left = "10";
                            this.top = "168";
                            this.bottom = "67";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":397,
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"currentLevelTitle",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":29.5,
                                            "y":10
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"EMPropLbl1_1",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":27.5,
                                            "y":34
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"EMPropLbl1_2",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":27.5,
                                            "y":54
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"EMPropLbl1_3",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":27.5,
                                            "y":74
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"EMPropLbl1_4",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":27.5,
                                            "y":94
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"EMPropLbl1_5",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":27.5,
                                            "y":114
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"EMPropLbl1_6",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":27.5,
                                            "y":134
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"EMPropLbl1_7",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":27.5,
                                            "y":154
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"EMPropLbl1_8",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":27.5,
                                            "y":174
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"WspPageSelRight",
                                            "enabled":false,
                                            "x":171,
                                            "y":66,
                                            "height":78,
                                            "width":34.2
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"nextLevelTitle",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":229.5,
                                            "y":10
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"EMPropLbl2_1",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":229.5,
                                            "y":31
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"EMPropLbl2_2",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":229.5,
                                            "y":51
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"EMPropLbl2_3",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":229.5,
                                            "y":71
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"EMPropLbl2_4",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":229.5,
                                            "y":91
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"EMPropLbl2_5",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":229.5,
                                            "y":111
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"EMPropLbl2_6",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":229.5,
                                            "y":131
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"EMPropLbl2_7",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":229.5,
                                            "y":151
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"EMPropLbl2_8",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":229.5,
                                            "y":171
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.left = "415";
                            this.bottom = "10";
                            this.top = "168";
                            this.right = "10";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"_ExplorerMedalPanel_RoundedLabel29",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":23.5,
                                            "y":10
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"EMTotalPropLbl1_1",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":23,
                                            "y":33
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"EMTotalPropLbl1_2",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":23,
                                            "y":53
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"EMTotalPropLbl1_3",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":23,
                                            "y":73
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"EMTotalPropLbl1_4",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":23,
                                            "y":93
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"EMTotalPropLbl1_5",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":23,
                                            "y":113
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"EMTotalPropLbl1_6",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":23,
                                            "y":133
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"EMTotalPropLbl1_7",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":23,
                                            "y":153
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"EMTotalPropLbl1_8",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":23,
                                            "y":173
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"EMTotalPropLbl1_9",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":149.5,
                                            "y":33
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"EMTotalPropLbl1_10",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":149.5,
                                            "y":53
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"EMTotalPropLbl1_11",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":149.5,
                                            "y":73
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"EMTotalPropLbl1_12",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":149.5,
                                            "y":93
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"EMTotalPropLbl1_13",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":149.5,
                                            "y":113
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"EMTotalPropLbl1_14",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":149.5,
                                            "y":133
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"EMTotalPropLbl1_15",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":149.5,
                                            "y":153
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"EMTotalPropLbl1_16",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 12;
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":149.5,
                                            "y":173
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":LinkButton,
                                    "id":"_ExplorerMedalPanel_LinkButton1",
                                    "events":{"click":"___ExplorerMedalPanel_LinkButton1_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":184.5,
                                            "y":228
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"currentEMP",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":14,
                                            "y":228
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":RoundedLabel,
                        "id":"nextLevelCost",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":143,
                                "y":375
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicDelayButton,
                        "id":"_ExplorerMedalPanel_BasicDelayButton1",
                        "events":{"click":"___ExplorerMedalPanel_BasicDelayButton1_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "clickDelay":700,
                                "styleName":"BtnStdGreen",
                                "x":70,
                                "y":398
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicDelayButton,
                        "id":"_ExplorerMedalPanel_BasicDelayButton2",
                        "events":{"click":"___ExplorerMedalPanel_BasicDelayButton2_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "clickDelay":700,
                                "styleName":"BtnStdGreen",
                                "x":173,
                                "y":398
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicDelayButton,
                        "id":"_ExplorerMedalPanel_BasicDelayButton3",
                        "events":{"click":"___ExplorerMedalPanel_BasicDelayButton3_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "clickDelay":700,
                                "styleName":"BtnStdGreen",
                                "x":262,
                                "y":398
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var eMedalLight:Array = [4130220001061, 4130220001062, 4130220001063, 4130220001064, 4130220001065, 4130220001066, 4130220001067, 4130220001068, 4130220001069, 4130220001070];
        private var eMedalDark:Array = [4130220001051, 4130220001052, 4130220001053, 4130220001054, 4130220001055, 4130220001056, 4130220001057, 4130220001058, 4130220001059, 4130220001060];
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function ExplorerMedalPanel()
        {
            mx_internal::_document = this;
            this.width = 700;
            this.height = 436;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            ExplorerMedalPanel._watcherSetupUtil = _arg_1;
        }


        public function set EMPropLbl2_6(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._272912898EMPropLbl2_6;
            if (_local_2 !== _arg_1)
            {
                this._272912898EMPropLbl2_6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "EMPropLbl2_6", _local_2, _arg_1));
            };
        }

        public function set EMPropLbl2_3(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._272912901EMPropLbl2_3;
            if (_local_2 !== _arg_1)
            {
                this._272912901EMPropLbl2_3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "EMPropLbl2_3", _local_2, _arg_1));
            };
        }

        public function ___ExplorerMedalPanel_BasicDelayButton1_click(_arg_1:MouseEvent):void
        {
            levelUpEMedal();
        }

        [Bindable(event="propertyChange")]
        public function get EMPropLbl2_3():RoundedLabel
        {
            return (this._272912901EMPropLbl2_3);
        }

        [Bindable(event="propertyChange")]
        public function get EMPropLbl2_7():RoundedLabel
        {
            return (this._272912897EMPropLbl2_7);
        }

        [Bindable(event="propertyChange")]
        public function get EMPropLbl2_8():RoundedLabel
        {
            return (this._272912896EMPropLbl2_8);
        }

        [Bindable(event="propertyChange")]
        public function get EMTotalPropLbl1_5():RoundedLabel
        {
            return (this._468962288EMTotalPropLbl1_5);
        }

        [Bindable(event="propertyChange")]
        public function get EMPropLbl2_2():RoundedLabel
        {
            return (this._272912902EMPropLbl2_2);
        }

        [Bindable(event="propertyChange")]
        public function get EMTotalPropLbl1_2():RoundedLabel
        {
            return (this._468962291EMTotalPropLbl1_2);
        }

        public function set EMPropLbl2_7(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._272912897EMPropLbl2_7;
            if (_local_2 !== _arg_1)
            {
                this._272912897EMPropLbl2_7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "EMPropLbl2_7", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get EMTotalPropLbl1_7():RoundedLabel
        {
            return (this._468962286EMTotalPropLbl1_7);
        }

        public function set EMPropLbl2_5(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._272912899EMPropLbl2_5;
            if (_local_2 !== _arg_1)
            {
                this._272912899EMPropLbl2_5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "EMPropLbl2_5", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get EMTotalPropLbl1_3():RoundedLabel
        {
            return (this._468962290EMTotalPropLbl1_3);
        }

        [Bindable(event="propertyChange")]
        public function get EMTotalPropLbl1_4():RoundedLabel
        {
            return (this._468962289EMTotalPropLbl1_4);
        }

        [Bindable(event="propertyChange")]
        public function get EMPropLbl2_5():RoundedLabel
        {
            return (this._272912899EMPropLbl2_5);
        }

        public function set EMTotalPropLbl1_5(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._468962288EMTotalPropLbl1_5;
            if (_local_2 !== _arg_1)
            {
                this._468962288EMTotalPropLbl1_5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "EMTotalPropLbl1_5", _local_2, _arg_1));
            };
        }

        public function set EMTotalPropLbl1_2(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._468962291EMTotalPropLbl1_2;
            if (_local_2 !== _arg_1)
            {
                this._468962291EMTotalPropLbl1_2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "EMTotalPropLbl1_2", _local_2, _arg_1));
            };
        }

        public function set EMTotalPropLbl1_3(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._468962290EMTotalPropLbl1_3;
            if (_local_2 !== _arg_1)
            {
                this._468962290EMTotalPropLbl1_3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "EMTotalPropLbl1_3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get EMTotalPropLbl1_1():RoundedLabel
        {
            return (this._468962292EMTotalPropLbl1_1);
        }

        public function set EMTotalPropLbl1_4(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._468962289EMTotalPropLbl1_4;
            if (_local_2 !== _arg_1)
            {
                this._468962289EMTotalPropLbl1_4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "EMTotalPropLbl1_4", _local_2, _arg_1));
            };
        }

        public function set EMTotalPropLbl1_8(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._468962285EMTotalPropLbl1_8;
            if (_local_2 !== _arg_1)
            {
                this._468962285EMTotalPropLbl1_8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "EMTotalPropLbl1_8", _local_2, _arg_1));
            };
        }

        public function set EMTotalPropLbl1_1(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._468962292EMTotalPropLbl1_1;
            if (_local_2 !== _arg_1)
            {
                this._468962292EMTotalPropLbl1_1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "EMTotalPropLbl1_1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get EMTotalPropLbl1_6():RoundedLabel
        {
            return (this._468962287EMTotalPropLbl1_6);
        }

        [Bindable(event="propertyChange")]
        public function get medal2():Image
        {
            return (this._1078038501medal2);
        }

        public function set EMTotalPropLbl1_7(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._468962286EMTotalPropLbl1_7;
            if (_local_2 !== _arg_1)
            {
                this._468962286EMTotalPropLbl1_7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "EMTotalPropLbl1_7", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get EMTotalPropLbl1_9():RoundedLabel
        {
            return (this._468962284EMTotalPropLbl1_9);
        }

        public function setGoldLock(_arg_1:Boolean):void
        {
            var _local_2:BagPanel = BagPanel(_core.view.getUI(ViewManager.PANEL_BAG));
            var _local_3:Boolean = _local_2.goldLockFlag;
            if (((!(_local_3 == _arg_1)) && (_local_2)))
            {
                _local_2.goldLockFlag = _arg_1;
            };
        }

        [Bindable(event="propertyChange")]
        public function get medal6():Image
        {
            return (this._1078038497medal6);
        }

        public function set EMTotalPropLbl1_9(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._468962284EMTotalPropLbl1_9;
            if (_local_2 !== _arg_1)
            {
                this._468962284EMTotalPropLbl1_9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "EMTotalPropLbl1_9", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get medal8():Image
        {
            return (this._1078038495medal8);
        }

        public function set EMTotalPropLbl1_6(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._468962287EMTotalPropLbl1_6;
            if (_local_2 !== _arg_1)
            {
                this._468962287EMTotalPropLbl1_6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "EMTotalPropLbl1_6", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get medal1():Image
        {
            return (this._1078038502medal1);
        }

        public function set medal1(_arg_1:Image):void
        {
            var _local_2:Object = this._1078038502medal1;
            if (_local_2 !== _arg_1)
            {
                this._1078038502medal1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "medal1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get EMTotalPropLbl1_8():RoundedLabel
        {
            return (this._468962285EMTotalPropLbl1_8);
        }

        [Bindable(event="propertyChange")]
        public function get EMPropLbl1_2():RoundedLabel
        {
            return (this._272913863EMPropLbl1_2);
        }

        [Bindable(event="propertyChange")]
        public function get EMPropLbl1_3():RoundedLabel
        {
            return (this._272913862EMPropLbl1_3);
        }

        [Bindable(event="propertyChange")]
        public function get EMPropLbl1_5():RoundedLabel
        {
            return (this._272913860EMPropLbl1_5);
        }

        [Bindable(event="propertyChange")]
        public function get EMPropLbl1_6():RoundedLabel
        {
            return (this._272913859EMPropLbl1_6);
        }

        [Bindable(event="propertyChange")]
        public function get EMPropLbl1_7():RoundedLabel
        {
            return (this._272913858EMPropLbl1_7);
        }

        [Bindable(event="propertyChange")]
        public function get EMPropLbl1_8():RoundedLabel
        {
            return (this._272913857EMPropLbl1_8);
        }

        public function set medal4(_arg_1:Image):void
        {
            var _local_2:Object = this._1078038499medal4;
            if (_local_2 !== _arg_1)
            {
                this._1078038499medal4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "medal4", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get EMPropLbl1_4():RoundedLabel
        {
            return (this._272913861EMPropLbl1_4);
        }

        public function set medal5(_arg_1:Image):void
        {
            var _local_2:Object = this._1078038498medal5;
            if (_local_2 !== _arg_1)
            {
                this._1078038498medal5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "medal5", _local_2, _arg_1));
            };
        }

        public function set EMPropLbl2_8(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._272912896EMPropLbl2_8;
            if (_local_2 !== _arg_1)
            {
                this._272912896EMPropLbl2_8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "EMPropLbl2_8", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get EMPropLbl1_1():RoundedLabel
        {
            return (this._272913864EMPropLbl1_1);
        }

        [Bindable(event="propertyChange")]
        public function get medal5():Image
        {
            return (this._1078038498medal5);
        }

        public function set medal6(_arg_1:Image):void
        {
            var _local_2:Object = this._1078038497medal6;
            if (_local_2 !== _arg_1)
            {
                this._1078038497medal6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "medal6", _local_2, _arg_1));
            };
        }

        public function set medal7(_arg_1:Image):void
        {
            var _local_2:Object = this._1078038496medal7;
            if (_local_2 !== _arg_1)
            {
                this._1078038496medal7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "medal7", _local_2, _arg_1));
            };
        }

        private function doUnlockMoneyGold(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                setGoldLock(false);
            };
        }

        public function set medal9(_arg_1:Image):void
        {
            var _local_2:Object = this._1078038494medal9;
            if (_local_2 !== _arg_1)
            {
                this._1078038494medal9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "medal9", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get medal3():Image
        {
            return (this._1078038500medal3);
        }

        [Bindable(event="propertyChange")]
        public function get medal4():Image
        {
            return (this._1078038499medal4);
        }

        public function set medal2(_arg_1:Image):void
        {
            var _local_2:Object = this._1078038501medal2;
            if (_local_2 !== _arg_1)
            {
                this._1078038501medal2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "medal2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get medal7():Image
        {
            return (this._1078038496medal7);
        }

        public function set medal3(_arg_1:Image):void
        {
            var _local_2:Object = this._1078038500medal3;
            if (_local_2 !== _arg_1)
            {
                this._1078038500medal3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "medal3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get title():BasicTitleCanvas
        {
            return (this._110371416title);
        }

        public function set medal8(_arg_1:Image):void
        {
            var _local_2:Object = this._1078038495medal8;
            if (_local_2 !== _arg_1)
            {
                this._1078038495medal8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "medal8", _local_2, _arg_1));
            };
        }

        public function set medalLabel10(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._772846308medalLabel10;
            if (_local_2 !== _arg_1)
            {
                this._772846308medalLabel10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "medalLabel10", _local_2, _arg_1));
            };
        }

        private function levelUpEMedalByGold(type:int):void
        {
            var handler:Function;
            var costGold:int = 50;
            if (type == 1)
            {
                costGold = 500;
            };
            handler = function (event:CloseEvent):void
            {
                var bagPanel:BagPanel;
                var goldLockFlag:Boolean;
                var gfunc:Function;
                if (event.detail == Alert.YES)
                {
                    if (ToolKit.isEqual(_cid, _core.cid))
                    {
                        bagPanel = BagPanel(_core.view.getUI(ViewManager.PANEL_BAG));
                        goldLockFlag = bagPanel.goldLockFlag;
                        if (((goldLockFlag) || (!(bagPanel))))
                        {
                            _core.sysMsg(Language.JUHUASUAN_PANEL[15]);
                            gfunc = function (_arg_1:String):void
                            {
                                _core.remote.call("unlockMoney", new Responder(doUnlockMoneyGold), MD5.hash(_arg_1));
                            };
                            _core.view.getUI(ViewManager.PANEL_INPUT).showInput(Language.DELETE_BY_PASS[0], Language.ACTIVEPANEL_S[38], gfunc);
                            return;
                        };
                        _core.remote.call("levelUpEMedalByGold", null, _core.cid, type);
                    };
                };
            };
            if (_alert)
            {
                PopUpManager.removePopUp(_alert);
                _alert = null;
            };
            var str:String = Language.EXPLORER_MEDAL_PANEL[22].toString().replace("{num}", costGold);
            _alert = Alert.show(str, null, (Alert.YES | Alert.NO), null, handler);
        }

        public function set EMPropLbl1_1(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._272913864EMPropLbl1_1;
            if (_local_2 !== _arg_1)
            {
                this._272913864EMPropLbl1_1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "EMPropLbl1_1", _local_2, _arg_1));
            };
        }

        public function set EMPropLbl1_2(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._272913863EMPropLbl1_2;
            if (_local_2 !== _arg_1)
            {
                this._272913863EMPropLbl1_2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "EMPropLbl1_2", _local_2, _arg_1));
            };
        }

        public function set EMPropLbl1_3(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._272913862EMPropLbl1_3;
            if (_local_2 !== _arg_1)
            {
                this._272913862EMPropLbl1_3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "EMPropLbl1_3", _local_2, _arg_1));
            };
        }

        public function set EMPropLbl1_5(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._272913860EMPropLbl1_5;
            if (_local_2 !== _arg_1)
            {
                this._272913860EMPropLbl1_5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "EMPropLbl1_5", _local_2, _arg_1));
            };
        }

        public function set EMPropLbl1_6(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._272913859EMPropLbl1_6;
            if (_local_2 !== _arg_1)
            {
                this._272913859EMPropLbl1_6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "EMPropLbl1_6", _local_2, _arg_1));
            };
        }

        public function set EMPropLbl1_7(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._272913858EMPropLbl1_7;
            if (_local_2 !== _arg_1)
            {
                this._272913858EMPropLbl1_7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "EMPropLbl1_7", _local_2, _arg_1));
            };
        }

        private function setExplorerMedals(_arg_1:int):void
        {
            var _local_2:int;
            if (((_arg_1 > 0) && (_arg_1 <= 100)))
            {
                _local_2 = int(Math.floor((_arg_1 / 10)));
                if ((_arg_1 % 10) > 0)
                {
                    _local_2 = (_local_2 + 1);
                };
            };
            var _local_3:int = 10;
            while (_local_3 > 0)
            {
                if (_local_2 >= _local_3)
                {
                    this[("medal" + _local_3)].source = ResManager.getIconUrl(eMedalLight[(_local_3 - 1)]);
                    if (((_arg_1 > 0) && ((((_arg_1 % 10) == 0) && (_local_2 == _local_3)) || (_local_2 > _local_3))))
                    {
                        this[("medal" + _local_3)].toolTip = Language.EXPLORER_MEDAL_TIPS[(_local_3 - 1)].replace("{label}", Language.EXPLORER_MEDAL_TIPS[14]).replace("{color}", Language.EXPLORER_MEDAL_TIPS[17]);
                    }
                    else
                    {
                        this[("medal" + _local_3)].toolTip = Language.EXPLORER_MEDAL_TIPS[(_local_3 - 1)].replace("{label}", Language.EXPLORER_MEDAL_TIPS[15]).replace("{color}", Language.EXPLORER_MEDAL_TIPS[16]);
                    };
                    _local_3--;
                }
                else
                {
                    this[("medal" + _local_3)].source = ResManager.getIconUrl(eMedalDark[(_local_3 - 1)]);
                    this[("medal" + _local_3)].toolTip = Language.EXPLORER_MEDAL_TIPS[(_local_3 - 1)].replace("{label}", Language.EXPLORER_MEDAL_TIPS[15]).replace("{color}", Language.EXPLORER_MEDAL_TIPS[16]);
                    _local_3--;
                };
            };
        }

        public function set EMPropLbl1_8(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._272913857EMPropLbl1_8;
            if (_local_2 !== _arg_1)
            {
                this._272913857EMPropLbl1_8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "EMPropLbl1_8", _local_2, _arg_1));
            };
        }

        public function set EMPropLbl1_4(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._272913861EMPropLbl1_4;
            if (_local_2 !== _arg_1)
            {
                this._272913861EMPropLbl1_4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "EMPropLbl1_4", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get currentEMP():RoundedLabel
        {
            return (this._1088999281currentEMP);
        }

        public function ___ExplorerMedalPanel_BasicDelayButton3_click(_arg_1:MouseEvent):void
        {
            levelUpEMedalByGold(1);
        }

        [Bindable(event="propertyChange")]
        public function get nextLevelTitle():RoundedLabel
        {
            return (this._1133593465nextLevelTitle);
        }

        [Bindable(event="propertyChange")]
        public function get medal9():Image
        {
            return (this._1078038494medal9);
        }

        public function set medal10(_arg_1:Image):void
        {
            var _local_2:Object = this._940544854medal10;
            if (_local_2 !== _arg_1)
            {
                this._940544854medal10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "medal10", _local_2, _arg_1));
            };
        }

        public function set title(_arg_1:BasicTitleCanvas):void
        {
            var _local_2:Object = this._110371416title;
            if (_local_2 !== _arg_1)
            {
                this._110371416title = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "title", _local_2, _arg_1));
            };
        }

        public function updateByManual():void
        {
            if (!initialized)
            {
                return;
            };
            _core.remote.call("initEMPanel", new Responder(updateEMPanel), _core.cid);
        }

        [Bindable(event="propertyChange")]
        public function get embg():Image
        {
            return (this._3116781embg);
        }

        private function _ExplorerMedalPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.EXPLORER_MEDAL_PANEL[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                title.text = _arg_1;
            }, "title.text");
            result[0] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220001071));
            }, function (_arg_1:Object):void
            {
                embg.source = _arg_1;
            }, "embg.source");
            result[1] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220001051));
            }, function (_arg_1:Object):void
            {
                medal1.source = _arg_1;
            }, "medal1.source");
            result[2] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220001052));
            }, function (_arg_1:Object):void
            {
                medal2.source = _arg_1;
            }, "medal2.source");
            result[3] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220001053));
            }, function (_arg_1:Object):void
            {
                medal3.source = _arg_1;
            }, "medal3.source");
            result[4] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220001054));
            }, function (_arg_1:Object):void
            {
                medal4.source = _arg_1;
            }, "medal4.source");
            result[5] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220001055));
            }, function (_arg_1:Object):void
            {
                medal5.source = _arg_1;
            }, "medal5.source");
            result[6] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220001056));
            }, function (_arg_1:Object):void
            {
                medal6.source = _arg_1;
            }, "medal6.source");
            result[7] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220001057));
            }, function (_arg_1:Object):void
            {
                medal7.source = _arg_1;
            }, "medal7.source");
            result[8] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220001058));
            }, function (_arg_1:Object):void
            {
                medal8.source = _arg_1;
            }, "medal8.source");
            result[9] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220001059));
            }, function (_arg_1:Object):void
            {
                medal9.source = _arg_1;
            }, "medal9.source");
            result[10] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220001060));
            }, function (_arg_1:Object):void
            {
                medal10.source = _arg_1;
            }, "medal10.source");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.EXPLORER_MEDAL_PANEL[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                medalLabel1.text = _arg_1;
            }, "medalLabel1.text");
            result[12] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.EXPLORER_MEDAL_PANEL[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                medalLabel2.text = _arg_1;
            }, "medalLabel2.text");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.EXPLORER_MEDAL_PANEL[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                medalLabel3.text = _arg_1;
            }, "medalLabel3.text");
            result[14] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.EXPLORER_MEDAL_PANEL[15];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                medalLabel4.text = _arg_1;
            }, "medalLabel4.text");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.EXPLORER_MEDAL_PANEL[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                medalLabel5.text = _arg_1;
            }, "medalLabel5.text");
            result[16] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.EXPLORER_MEDAL_PANEL[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                medalLabel6.text = _arg_1;
            }, "medalLabel6.text");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.EXPLORER_MEDAL_PANEL[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                medalLabel7.text = _arg_1;
            }, "medalLabel7.text");
            result[18] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.EXPLORER_MEDAL_PANEL[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                medalLabel8.text = _arg_1;
            }, "medalLabel8.text");
            result[19] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.EXPLORER_MEDAL_PANEL[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                medalLabel9.text = _arg_1;
            }, "medalLabel9.text");
            result[20] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.EXPLORER_MEDAL_PANEL[21];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                medalLabel10.text = _arg_1;
            }, "medalLabel10.text");
            result[21] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.EXPLORER_MEDAL_PANEL[7];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                currentLevelTitle.text = _arg_1;
            }, "currentLevelTitle.text");
            result[22] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.EXPLORER_MEDAL_PANEL[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                nextLevelTitle.text = _arg_1;
            }, "nextLevelTitle.text");
            result[23] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.EXPLORER_MEDAL_PANEL[3];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ExplorerMedalPanel_RoundedLabel29.text = _arg_1;
            }, "_ExplorerMedalPanel_RoundedLabel29.text");
            result[24] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAGIC_CRYSTAL_PANEL[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ExplorerMedalPanel_LinkButton1.label = _arg_1;
            }, "_ExplorerMedalPanel_LinkButton1.label");
            result[25] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.EXPLORER_MEDAL_PANEL[5];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                currentEMP.text = _arg_1;
            }, "currentEMP.text");
            result[26] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.EXPLORER_MEDAL_PANEL[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                nextLevelCost.text = _arg_1;
            }, "nextLevelCost.text");
            result[27] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.EXPLORER_MEDAL_PANEL[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ExplorerMedalPanel_BasicDelayButton1.label = _arg_1;
            }, "_ExplorerMedalPanel_BasicDelayButton1.label");
            result[28] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.EXPLORER_MEDAL_TIPS[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ExplorerMedalPanel_BasicDelayButton1.toolTip = _arg_1;
            }, "_ExplorerMedalPanel_BasicDelayButton1.toolTip");
            result[29] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.EXPLORER_MEDAL_PANEL[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ExplorerMedalPanel_BasicDelayButton2.label = _arg_1;
            }, "_ExplorerMedalPanel_BasicDelayButton2.label");
            result[30] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.EXPLORER_MEDAL_TIPS[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ExplorerMedalPanel_BasicDelayButton2.toolTip = _arg_1;
            }, "_ExplorerMedalPanel_BasicDelayButton2.toolTip");
            result[31] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.EXPLORER_MEDAL_PANEL[11];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ExplorerMedalPanel_BasicDelayButton3.label = _arg_1;
            }, "_ExplorerMedalPanel_BasicDelayButton3.label");
            result[32] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.EXPLORER_MEDAL_TIPS[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _ExplorerMedalPanel_BasicDelayButton3.toolTip = _arg_1;
            }, "_ExplorerMedalPanel_BasicDelayButton3.toolTip");
            result[33] = binding;
            return (result);
        }

        public function showPanel():void
        {
            this.show();
            if (!initialized)
            {
                callLater(showPanel);
                return;
            };
            if (!ToolKit.isEqual(_cid, _core.cid))
            {
                _cid = _core.cid;
                _core.remote.call("initEMPanel", new Responder(updateEMPanel), _cid);
            }
            else
            {
                show();
                if (_emInfo)
                {
                    updateEMPanel(_emInfo);
                };
            };
        }

        public function set nextLevelTitle(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1133593465nextLevelTitle;
            if (_local_2 !== _arg_1)
            {
                this._1133593465nextLevelTitle = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nextLevelTitle", _local_2, _arg_1));
            };
        }

        public function ___ExplorerMedalPanel_LinkButton1_click(_arg_1:MouseEvent):void
        {
            helpInfo();
        }

        public function set currentEMP(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1088999281currentEMP;
            if (_local_2 !== _arg_1)
            {
                this._1088999281currentEMP = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "currentEMP", _local_2, _arg_1));
            };
        }

        public function set currentLevelTitle(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1141243789currentLevelTitle;
            if (_local_2 !== _arg_1)
            {
                this._1141243789currentLevelTitle = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "currentLevelTitle", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get medalLabel10():RoundedLabel
        {
            return (this._772846308medalLabel10);
        }

        public function set medalLabel1(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._440572524medalLabel1;
            if (_local_2 !== _arg_1)
            {
                this._440572524medalLabel1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "medalLabel1", _local_2, _arg_1));
            };
        }

        public function set medalLabel4(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._440572521medalLabel4;
            if (_local_2 !== _arg_1)
            {
                this._440572521medalLabel4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "medalLabel4", _local_2, _arg_1));
            };
        }

        public function set medalLabel5(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._440572520medalLabel5;
            if (_local_2 !== _arg_1)
            {
                this._440572520medalLabel5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "medalLabel5", _local_2, _arg_1));
            };
        }

        public function set medalLabel6(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._440572519medalLabel6;
            if (_local_2 !== _arg_1)
            {
                this._440572519medalLabel6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "medalLabel6", _local_2, _arg_1));
            };
        }

        public function set medalLabel3(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._440572522medalLabel3;
            if (_local_2 !== _arg_1)
            {
                this._440572522medalLabel3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "medalLabel3", _local_2, _arg_1));
            };
        }

        public function set medalLabel7(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._440572518medalLabel7;
            if (_local_2 !== _arg_1)
            {
                this._440572518medalLabel7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "medalLabel7", _local_2, _arg_1));
            };
        }

        private function setPropColumns(_arg_1:Object, _arg_2:int, _arg_3:int):void
        {
            var _local_5:*;
            cleanColumns(_arg_2);
            if (_arg_2 == 1)
            {
                currentLevelTitle.text = Language.EXPLORER_MEDAL_PANEL[7].replace("{medal}", _arg_1.name);
            };
            if (_arg_2 == 2)
            {
                nextLevelTitle.text = Language.EXPLORER_MEDAL_PANEL[8].replace("{medal}", _arg_1.name);
                nextLevelCost.text = Language.EXPLORER_MEDAL_PANEL[6].replace("{num}", ((_arg_3 + "/") + _arg_1.cost));
                _nextLevelCost = _arg_1.cost;
            };
            var _local_4:int = 1;
            while (_local_4 <= 8)
            {
                _local_5 = _arg_1[("propType" + _local_4)];
                if (_local_5 > 0)
                {
                    this[((("EMPropLbl" + _arg_2) + "_") + _local_4)].text = (Language.EXPLORER_MEDAL_PROP[_local_5] + Number(_arg_1[("propNum" + _local_4)]));
                };
                _local_4++;
            };
        }

        public function set medalLabel2(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._440572523medalLabel2;
            if (_local_2 !== _arg_1)
            {
                this._440572523medalLabel2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "medalLabel2", _local_2, _arg_1));
            };
        }

        public function ___ExplorerMedalPanel_BasicDelayButton2_click(_arg_1:MouseEvent):void
        {
            levelUpEMedalByGold(0);
        }

        public function set medalLabel9(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._440572516medalLabel9;
            if (_local_2 !== _arg_1)
            {
                this._440572516medalLabel9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "medalLabel9", _local_2, _arg_1));
            };
        }

        public function set EMTotalPropLbl1_11(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1652929115EMTotalPropLbl1_11;
            if (_local_2 !== _arg_1)
            {
                this._1652929115EMTotalPropLbl1_11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "EMTotalPropLbl1_11", _local_2, _arg_1));
            };
        }

        public function set EMTotalPropLbl1_12(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1652929114EMTotalPropLbl1_12;
            if (_local_2 !== _arg_1)
            {
                this._1652929114EMTotalPropLbl1_12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "EMTotalPropLbl1_12", _local_2, _arg_1));
            };
        }

        public function set EMTotalPropLbl1_13(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1652929113EMTotalPropLbl1_13;
            if (_local_2 !== _arg_1)
            {
                this._1652929113EMTotalPropLbl1_13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "EMTotalPropLbl1_13", _local_2, _arg_1));
            };
        }

        public function set EMTotalPropLbl1_10(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1652929116EMTotalPropLbl1_10;
            if (_local_2 !== _arg_1)
            {
                this._1652929116EMTotalPropLbl1_10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "EMTotalPropLbl1_10", _local_2, _arg_1));
            };
        }

        public function set EMTotalPropLbl1_14(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1652929112EMTotalPropLbl1_14;
            if (_local_2 !== _arg_1)
            {
                this._1652929112EMTotalPropLbl1_14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "EMTotalPropLbl1_14", _local_2, _arg_1));
            };
        }

        public function set EMTotalPropLbl1_15(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1652929111EMTotalPropLbl1_15;
            if (_local_2 !== _arg_1)
            {
                this._1652929111EMTotalPropLbl1_15 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "EMTotalPropLbl1_15", _local_2, _arg_1));
            };
        }

        public function updateEMPanel(_arg_1:Array):void
        {
            var _local_7:Object;
            var _local_8:Object;
            _emInfo = _arg_1;
            var _local_2:* = _arg_1[1];
            var _local_3:int = ((_arg_1[0]) ? _arg_1[0] : 0);
            var _local_4:int = ((_arg_1[2]) ? _arg_1[2] : 0);
            var _local_5:int = ((_arg_1[3]) ? _arg_1[3] : 0);
            var _local_6:int;
            if (_local_3 == 0)
            {
                cleanColumns(1);
                cleanColumns(2);
                _local_6 = 1;
                _local_7 = GameData.d[GamePredef.TBL_EXPLORER_MEDAL][_local_6];
                setPropColumns(_local_7, 2, _local_5);
                currentLevelTitle.text = Language.EXPLORER_MEDAL_PANEL[9];
            }
            else
            {
                if (_local_3 == 100)
                {
                    _local_8 = GameData.d[GamePredef.TBL_EXPLORER_MEDAL][_local_3];
                    setPropColumns(_local_8, 1, _local_5);
                    cleanColumns(2);
                    nextLevelCost.text = Language.EXPLORER_MEDAL_PANEL[23];
                    nextLevelTitle.text = Language.EXPLORER_MEDAL_PANEL[4];
                }
                else
                {
                    _local_6 = (_local_3 + 1);
                    _local_8 = GameData.d[GamePredef.TBL_EXPLORER_MEDAL][_local_3];
                    _local_7 = GameData.d[GamePredef.TBL_EXPLORER_MEDAL][_local_6];
                    setPropColumns(_local_8, 1, _local_5);
                    setPropColumns(_local_7, 2, _local_5);
                };
            };
            currentEMP.text = Language.EXPLORER_MEDAL_PANEL[5].replace("{num}", _local_4);
            setExplorerMedals(_local_3);
            setTotalPropColumns(_local_2);
        }

        private function cleanColumns(_arg_1:int):void
        {
            var _local_2:int = 8;
            while (_local_2 > 0)
            {
                if (_arg_1 == 1)
                {
                    this[("EMPropLbl1_" + _local_2)].text = "";
                };
                if (_arg_1 == 2)
                {
                    this[("EMPropLbl2_" + _local_2)].text = "";
                };
                _local_2--;
            };
        }

        [Bindable(event="propertyChange")]
        public function get medal10():Image
        {
            return (this._940544854medal10);
        }

        public function set medalLabel8(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._440572517medalLabel8;
            if (_local_2 !== _arg_1)
            {
                this._440572517medalLabel8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "medalLabel8", _local_2, _arg_1));
            };
        }

        public function set EMTotalPropLbl1_16(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1652929110EMTotalPropLbl1_16;
            if (_local_2 !== _arg_1)
            {
                this._1652929110EMTotalPropLbl1_16 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "EMTotalPropLbl1_16", _local_2, _arg_1));
            };
        }

        public function set nextLevelCost(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._378573758nextLevelCost;
            if (_local_2 !== _arg_1)
            {
                this._378573758nextLevelCost = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nextLevelCost", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get currentLevelTitle():RoundedLabel
        {
            return (this._1141243789currentLevelTitle);
        }

        private function helpInfo():void
        {
            if (_helpAlert)
            {
                PopUpManager.removePopUp(_helpAlert);
                _helpAlert = null;
            };
            var _local_1:String = Language.EXPLORER_MEDAL_PANEL[10].toString();
            _helpAlert = Alert.show(_local_1, Language.MAGIC_CRYSTAL_PANEL[20].toString(), Alert.YES, null, null);
        }

        override public function initialize():void
        {
            var target:ExplorerMedalPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _ExplorerMedalPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_ExplorerMedalPanelWatcherSetupUtil");
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

        [Bindable(event="propertyChange")]
        public function get medalLabel2():RoundedLabel
        {
            return (this._440572523medalLabel2);
        }

        private function setTotalPropColumns(_arg_1:Object):void
        {
            var _local_4:*;
            if (!_arg_1)
            {
                return;
            };
            var _local_2:int = 16;
            while (_local_2 > 0)
            {
                this[("EMTotalPropLbl1_" + _local_2)].text = "";
                _local_2--;
            };
            var _local_3:int = 1;
            for (_local_4 in _arg_1)
            {
                if (((_arg_1[_local_4] > 0) && (_local_3 <= 16)))
                {
                    this[("EMTotalPropLbl1_" + _local_3)].text = (Language.EXPLORER_MEDAL_PROP[_local_4] + ToolKit.getRound(Number(_arg_1[_local_4]), 3));
                    _local_3++;
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get medalLabel7():RoundedLabel
        {
            return (this._440572518medalLabel7);
        }

        [Bindable(event="propertyChange")]
        public function get medalLabel9():RoundedLabel
        {
            return (this._440572516medalLabel9);
        }

        [Bindable(event="propertyChange")]
        public function get medalLabel3():RoundedLabel
        {
            return (this._440572522medalLabel3);
        }

        [Bindable(event="propertyChange")]
        public function get medalLabel6():RoundedLabel
        {
            return (this._440572519medalLabel6);
        }

        [Bindable(event="propertyChange")]
        public function get medalLabel1():RoundedLabel
        {
            return (this._440572524medalLabel1);
        }

        [Bindable(event="propertyChange")]
        public function get EMTotalPropLbl1_10():RoundedLabel
        {
            return (this._1652929116EMTotalPropLbl1_10);
        }

        [Bindable(event="propertyChange")]
        public function get EMTotalPropLbl1_11():RoundedLabel
        {
            return (this._1652929115EMTotalPropLbl1_11);
        }

        [Bindable(event="propertyChange")]
        public function get EMTotalPropLbl1_12():RoundedLabel
        {
            return (this._1652929114EMTotalPropLbl1_12);
        }

        [Bindable(event="propertyChange")]
        public function get EMTotalPropLbl1_13():RoundedLabel
        {
            return (this._1652929113EMTotalPropLbl1_13);
        }

        [Bindable(event="propertyChange")]
        public function get EMTotalPropLbl1_14():RoundedLabel
        {
            return (this._1652929112EMTotalPropLbl1_14);
        }

        [Bindable(event="propertyChange")]
        public function get EMTotalPropLbl1_15():RoundedLabel
        {
            return (this._1652929111EMTotalPropLbl1_15);
        }

        [Bindable(event="propertyChange")]
        public function get EMTotalPropLbl1_16():RoundedLabel
        {
            return (this._1652929110EMTotalPropLbl1_16);
        }

        private function _ExplorerMedalPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.EXPLORER_MEDAL_PANEL[0];
            _local_1 = ResManager.getIconUrl(4130220001071);
            _local_1 = ResManager.getIconUrl(4130220001051);
            _local_1 = ResManager.getIconUrl(4130220001052);
            _local_1 = ResManager.getIconUrl(4130220001053);
            _local_1 = ResManager.getIconUrl(4130220001054);
            _local_1 = ResManager.getIconUrl(4130220001055);
            _local_1 = ResManager.getIconUrl(4130220001056);
            _local_1 = ResManager.getIconUrl(4130220001057);
            _local_1 = ResManager.getIconUrl(4130220001058);
            _local_1 = ResManager.getIconUrl(4130220001059);
            _local_1 = ResManager.getIconUrl(4130220001060);
            _local_1 = Language.EXPLORER_MEDAL_PANEL[12];
            _local_1 = Language.EXPLORER_MEDAL_PANEL[13];
            _local_1 = Language.EXPLORER_MEDAL_PANEL[14];
            _local_1 = Language.EXPLORER_MEDAL_PANEL[15];
            _local_1 = Language.EXPLORER_MEDAL_PANEL[16];
            _local_1 = Language.EXPLORER_MEDAL_PANEL[17];
            _local_1 = Language.EXPLORER_MEDAL_PANEL[18];
            _local_1 = Language.EXPLORER_MEDAL_PANEL[19];
            _local_1 = Language.EXPLORER_MEDAL_PANEL[20];
            _local_1 = Language.EXPLORER_MEDAL_PANEL[21];
            _local_1 = Language.EXPLORER_MEDAL_PANEL[7];
            _local_1 = Language.EXPLORER_MEDAL_PANEL[8];
            _local_1 = Language.EXPLORER_MEDAL_PANEL[3];
            _local_1 = Language.MAGIC_CRYSTAL_PANEL[20];
            _local_1 = Language.EXPLORER_MEDAL_PANEL[5];
            _local_1 = Language.EXPLORER_MEDAL_PANEL[6];
            _local_1 = Language.EXPLORER_MEDAL_PANEL[1];
            _local_1 = Language.EXPLORER_MEDAL_TIPS[11];
            _local_1 = Language.EXPLORER_MEDAL_PANEL[2];
            _local_1 = Language.EXPLORER_MEDAL_TIPS[12];
            _local_1 = Language.EXPLORER_MEDAL_PANEL[11];
            _local_1 = Language.EXPLORER_MEDAL_TIPS[13];
        }

        [Bindable(event="propertyChange")]
        public function get medalLabel4():RoundedLabel
        {
            return (this._440572521medalLabel4);
        }

        private function levelUpEMedal():void
        {
            if (ToolKit.isEqual(_cid, _core.cid))
            {
                _core.remote.call("levelUpEMedal", null, _core.cid);
            };
        }

        public function set canvas1(_arg_1:Canvas):void
        {
            var _local_2:Object = this._550778329canvas1;
            if (_local_2 !== _arg_1)
            {
                this._550778329canvas1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "canvas1", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get medalLabel8():RoundedLabel
        {
            return (this._440572517medalLabel8);
        }

        [Bindable(event="propertyChange")]
        public function get medalLabel5():RoundedLabel
        {
            return (this._440572520medalLabel5);
        }

        [Bindable(event="propertyChange")]
        public function get nextLevelCost():RoundedLabel
        {
            return (this._378573758nextLevelCost);
        }

        public function set embg(_arg_1:Image):void
        {
            var _local_2:Object = this._3116781embg;
            if (_local_2 !== _arg_1)
            {
                this._3116781embg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "embg", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get canvas1():Canvas
        {
            return (this._550778329canvas1);
        }

        public function set EMPropLbl2_1(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._272912903EMPropLbl2_1;
            if (_local_2 !== _arg_1)
            {
                this._272912903EMPropLbl2_1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "EMPropLbl2_1", _local_2, _arg_1));
            };
        }

        public function set EMPropLbl2_2(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._272912902EMPropLbl2_2;
            if (_local_2 !== _arg_1)
            {
                this._272912902EMPropLbl2_2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "EMPropLbl2_2", _local_2, _arg_1));
            };
        }

        public function set EMPropLbl2_4(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._272912900EMPropLbl2_4;
            if (_local_2 !== _arg_1)
            {
                this._272912900EMPropLbl2_4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "EMPropLbl2_4", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get EMPropLbl2_1():RoundedLabel
        {
            return (this._272912903EMPropLbl2_1);
        }

        [Bindable(event="propertyChange")]
        public function get EMPropLbl2_4():RoundedLabel
        {
            return (this._272912900EMPropLbl2_4);
        }

        [Bindable(event="propertyChange")]
        public function get EMPropLbl2_6():RoundedLabel
        {
            return (this._272912898EMPropLbl2_6);
        }


    }
}//package com.qeedoo.ui.view.compDragable

