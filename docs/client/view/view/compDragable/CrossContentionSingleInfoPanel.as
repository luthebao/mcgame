// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.CrossContentionSingleInfoPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.RoundedLabel;
    import mx.controls.Alert;
    import mx.controls.Image;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.controls.LinkButton;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import mx.events.FlexEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.ui.resource.ResManager;
    import mx.managers.PopUpManager;
    import com.qeedoo.ui.view.comp.CrossContentionIcon;
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

    use namespace mx_internal;

    public class CrossContentionSingleInfoPanel extends DragableCanvas implements IBindingClient 
    {

        public static var areaUrl:Array = [0, 4130220000331, 4130220000330, 4130220000329, 4130220000332, 4130220000333];
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _74925319unoccypy3:RoundedLabel;
        private var _247605121firstoccupy:RoundedLabel;
        private var _1636875842occypy1:RoundedLabel;
        private var _1665385320areaname:RoundedLabel;
        private var _helpAlert:Alert;
        private var _1245447979pointIcon4:Image;
        private var _1636875839occypy4:RoundedLabel;
        private var _1636875841occypy2:RoundedLabel;
        private var _2022655936boosstate:RoundedLabel;
        private var _2132384574btnPointsAward:BasicGlowButton;
        private var _1636875838occypy5:RoundedLabel;
        private var _1825700023bordername:RoundedLabel;
        private var _1636875840occypy3:RoundedLabel;
        private var _1666485594areaIcon:Image;
        private var _1245447978pointIcon3:Image;
        public var _CrossContentionSingleInfoPanel_LinkButton1:LinkButton;
        private var _1287834292panelTitle:BasicTitleCanvas;
        private var _1245447977pointIcon2:Image;
        public var _CrossContentionSingleInfoPanel_RoundedLabel5:RoundedLabel;
        public var _CrossContentionSingleInfoPanel_RoundedLabel7:RoundedLabel;
        public var _CrossContentionSingleInfoPanel_RoundedLabel8:RoundedLabel;
        public var _CrossContentionSingleInfoPanel_RoundedLabel9:RoundedLabel;
        private var _74925320unoccypy4:RoundedLabel;
        private var _601956334currentlord:RoundedLabel;
        private var inited:Boolean = false;
        private var _1245447980pointIcon5:Image;
        private var _74925317unoccypy1:RoundedLabel;
        private var _74925321unoccypy5:RoundedLabel;
        private var _1245447976pointIcon1:Image;
        private var _74925318unoccypy2:RoundedLabel;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":475,
                    "height":405,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"panelTitle"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.left = "7";
                            this.right = "7";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":40,
                                "styleName":"RoundedGradientBorder",
                                "height":335,
                                "horizontalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "12";
                                        this.top = "10";
                                        this.right = "12";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "height":85,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "5";
                                                    this.verticalCenter = "0";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "height":83,
                                                        "width":83,
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Image,
                                                            "id":"areaIcon",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "5";
                                                                this.horizontalCenter = "0";
                                                                this.verticalCenter = "0";
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":95,
                                                        "y":0,
                                                        "height":85,
                                                        "width":300,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"areaname",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 16;
                                                                this.color = 0xFFFF00;
                                                                this.fontWeight = "bold";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":0,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"firstoccupy",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 16;
                                                                this.color = 0xFFFF00;
                                                                this.fontWeight = "bold";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":20,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"currentlord",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 16;
                                                                this.color = 0xFFFF00;
                                                                this.fontWeight = "bold";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":40,
                                                                    "width":250
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"boosstate",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 16;
                                                                this.color = 0xFFFF00;
                                                                this.fontWeight = "bold";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "y":60,
                                                                    "width":250
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "12";
                                        this.top = "110";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":425,
                                            "height":60,
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off",
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"_CrossContentionSingleInfoPanel_RoundedLabel5",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 16;
                                                    this.color = 0xFFFFFF;
                                                    this.fontWeight = "bold";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":0,
                                                        "width":250
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"bordername",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 14;
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":25,
                                                        "width":430
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "12";
                                        this.top = "170";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "height":110,
                                            "percentWidth":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"_CrossContentionSingleInfoPanel_RoundedLabel7",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 16;
                                                    this.color = 0xFFFFFF;
                                                    this.fontWeight = "bold";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "y":0,
                                                        "width":200
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "60";
                                                    this.top = "25";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "percentWidth":100,
                                                        "height":80,
                                                        "horizontalScrollPolicy":"off",
                                                        "verticalScrollPolicy":"off",
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "10";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":78,
                                                                    "height":78,
                                                                    "horizontalScrollPolicy":"off",
                                                                    "verticalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"pointIcon1",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "0";
                                                                            this.verticalCenter = "0";
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "80";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":78,
                                                                    "height":78,
                                                                    "horizontalScrollPolicy":"off",
                                                                    "verticalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"pointIcon2",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "0";
                                                                            this.verticalCenter = "0";
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "150";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":78,
                                                                    "height":78,
                                                                    "horizontalScrollPolicy":"off",
                                                                    "verticalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"pointIcon3",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "0";
                                                                            this.verticalCenter = "0";
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "220";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":78,
                                                                    "height":78,
                                                                    "horizontalScrollPolicy":"off",
                                                                    "verticalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"pointIcon4",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "0";
                                                                            this.verticalCenter = "0";
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":Canvas,
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.left = "300";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "width":78,
                                                                    "height":78,
                                                                    "horizontalScrollPolicy":"off",
                                                                    "verticalScrollPolicy":"off",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":Image,
                                                                        "id":"pointIcon5",
                                                                        "stylesFactory":function ():void
                                                                        {
                                                                            this.horizontalCenter = "0";
                                                                            this.verticalCenter = "0";
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
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "12";
                                        this.top = "280";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "height":50,
                                            "percentWidth":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"_CrossContentionSingleInfoPanel_RoundedLabel8",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 14;
                                                    this.color = 0xFFFFFF;
                                                    this.fontWeight = "bold";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0,
                                                        "y":0,
                                                        "width":100
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":RoundedLabel,
                                                "id":"_CrossContentionSingleInfoPanel_RoundedLabel9",
                                                "stylesFactory":function ():void
                                                {
                                                    this.fontSize = 14;
                                                    this.color = 0xFFFFFF;
                                                    this.fontWeight = "bold";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0,
                                                        "y":25,
                                                        "width":100
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "stylesFactory":function ():void
                                                {
                                                    this.left = "105";
                                                    this.top = "0";
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "percentHeight":100,
                                                        "percentWidth":100,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"occypy1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 14;
                                                                this.color = 0xFFFFFF;
                                                                this.fontWeight = "bold";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "htmlText":"1",
                                                                    "x":0,
                                                                    "y":0,
                                                                    "width":30
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"occypy2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 14;
                                                                this.color = 0x8000;
                                                                this.fontWeight = "bold";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "htmlText":"2",
                                                                    "x":70,
                                                                    "y":0,
                                                                    "width":30
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"occypy3",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 14;
                                                                this.color = 33023;
                                                                this.fontWeight = "bold";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "htmlText":"3",
                                                                    "x":140,
                                                                    "y":0,
                                                                    "width":30
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"occypy4",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 14;
                                                                this.color = 8421631;
                                                                this.fontWeight = "bold";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "htmlText":"4",
                                                                    "x":210,
                                                                    "y":0,
                                                                    "width":30
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"occypy5",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 14;
                                                                this.color = 16744512;
                                                                this.fontWeight = "bold";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "htmlText":"5",
                                                                    "x":280,
                                                                    "y":0,
                                                                    "width":30
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"unoccypy1",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 14;
                                                                this.color = 0xFFFFFF;
                                                                this.fontWeight = "bold";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "htmlText":"1",
                                                                    "x":0,
                                                                    "y":25,
                                                                    "width":30
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"unoccypy2",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 14;
                                                                this.color = 0x8000;
                                                                this.fontWeight = "bold";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "htmlText":"2",
                                                                    "x":70,
                                                                    "y":25,
                                                                    "width":30
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"unoccypy3",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 14;
                                                                this.color = 33023;
                                                                this.fontWeight = "bold";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "htmlText":"3",
                                                                    "x":140,
                                                                    "y":25,
                                                                    "width":30
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"unoccypy4",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 14;
                                                                this.color = 8421631;
                                                                this.fontWeight = "bold";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "htmlText":"4",
                                                                    "x":210,
                                                                    "y":25,
                                                                    "width":30
                                                                });
                                                            }
                                                        }), new UIComponentDescriptor({
                                                            "type":RoundedLabel,
                                                            "id":"unoccypy5",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.fontSize = 14;
                                                                this.color = 16744512;
                                                                this.fontWeight = "bold";
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "htmlText":"5",
                                                                    "x":280,
                                                                    "y":25,
                                                                    "width":30
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
                    }), new UIComponentDescriptor({
                        "type":BasicGlowButton,
                        "id":"btnPointsAward",
                        "events":{"click":"__btnPointsAward_click"},
                        "stylesFactory":function ():void
                        {
                            this.bottom = "7";
                            this.left = "207";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":60,
                                "styleName":"BtnStdRed"
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":LinkButton,
                        "id":"_CrossContentionSingleInfoPanel_LinkButton1",
                        "events":{"click":"___CrossContentionSingleInfoPanel_LinkButton1_click"},
                        "stylesFactory":function ():void
                        {
                            this.right = "10";
                            this.bottom = "7";
                            this.color = 0xFFE600;
                            this.textDecoration = "underline";
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        private var mapData:Object = new Object();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function CrossContentionSingleInfoPanel()
        {
            mx_internal::_document = this;
            this.width = 475;
            this.height = 405;
            this.styleName = "StandardContent";
            this.addEventListener("creationComplete", ___CrossContentionSingleInfoPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            CrossContentionSingleInfoPanel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get unoccypy1():RoundedLabel
        {
            return (this._74925317unoccypy1);
        }

        [Bindable(event="propertyChange")]
        public function get unoccypy2():RoundedLabel
        {
            return (this._74925318unoccypy2);
        }

        public function showPanel(_arg_1:int):void
        {
            _core.remote.call("getCrossContentionSingleState", null, _arg_1);
        }

        [Bindable(event="propertyChange")]
        public function get unoccypy5():RoundedLabel
        {
            return (this._74925321unoccypy5);
        }

        [Bindable(event="propertyChange")]
        public function get unoccypy3():RoundedLabel
        {
            return (this._74925319unoccypy3);
        }

        [Bindable(event="propertyChange")]
        public function get unoccypy4():RoundedLabel
        {
            return (this._74925320unoccypy4);
        }

        private function init():void
        {
        }

        public function set unoccypy1(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._74925317unoccypy1;
            if (_local_2 !== _arg_1)
            {
                this._74925317unoccypy1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "unoccypy1", _local_2, _arg_1));
            };
        }

        public function set unoccypy5(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._74925321unoccypy5;
            if (_local_2 !== _arg_1)
            {
                this._74925321unoccypy5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "unoccypy5", _local_2, _arg_1));
            };
        }

        public function set unoccypy2(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._74925318unoccypy2;
            if (_local_2 !== _arg_1)
            {
                this._74925318unoccypy2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "unoccypy2", _local_2, _arg_1));
            };
        }

        public function set unoccypy3(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._74925319unoccypy3;
            if (_local_2 !== _arg_1)
            {
                this._74925319unoccypy3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "unoccypy3", _local_2, _arg_1));
            };
        }

        public function set unoccypy4(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._74925320unoccypy4;
            if (_local_2 !== _arg_1)
            {
                this._74925320unoccypy4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "unoccypy4", _local_2, _arg_1));
            };
        }

        public function __btnPointsAward_click(_arg_1:MouseEvent):void
        {
            enter();
        }

        [Bindable(event="propertyChange")]
        public function get pointIcon2():Image
        {
            return (this._1245447977pointIcon2);
        }

        [Bindable(event="propertyChange")]
        public function get pointIcon3():Image
        {
            return (this._1245447978pointIcon3);
        }

        [Bindable(event="propertyChange")]
        public function get pointIcon4():Image
        {
            return (this._1245447979pointIcon4);
        }

        public function ___CrossContentionSingleInfoPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        [Bindable(event="propertyChange")]
        public function get pointIcon1():Image
        {
            return (this._1245447976pointIcon1);
        }

        public function ___CrossContentionSingleInfoPanel_LinkButton1_click(_arg_1:MouseEvent):void
        {
            howToPlay();
        }

        public function set areaname(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1665385320areaname;
            if (_local_2 !== _arg_1)
            {
                this._1665385320areaname = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "areaname", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get pointIcon5():Image
        {
            return (this._1245447980pointIcon5);
        }

        [Bindable(event="propertyChange")]
        public function get boosstate():RoundedLabel
        {
            return (this._2022655936boosstate);
        }

        [Bindable(event="propertyChange")]
        public function get btnPointsAward():BasicGlowButton
        {
            return (this._2132384574btnPointsAward);
        }

        public function set areaIcon(_arg_1:Image):void
        {
            var _local_2:Object = this._1666485594areaIcon;
            if (_local_2 !== _arg_1)
            {
                this._1666485594areaIcon = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "areaIcon", _local_2, _arg_1));
            };
        }

        public function set pointIcon1(_arg_1:Image):void
        {
            var _local_2:Object = this._1245447976pointIcon1;
            if (_local_2 !== _arg_1)
            {
                this._1245447976pointIcon1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pointIcon1", _local_2, _arg_1));
            };
        }

        public function set pointIcon2(_arg_1:Image):void
        {
            var _local_2:Object = this._1245447977pointIcon2;
            if (_local_2 !== _arg_1)
            {
                this._1245447977pointIcon2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pointIcon2", _local_2, _arg_1));
            };
        }

        public function set pointIcon4(_arg_1:Image):void
        {
            var _local_2:Object = this._1245447979pointIcon4;
            if (_local_2 !== _arg_1)
            {
                this._1245447979pointIcon4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pointIcon4", _local_2, _arg_1));
            };
        }

        public function set pointIcon5(_arg_1:Image):void
        {
            var _local_2:Object = this._1245447980pointIcon5;
            if (_local_2 !== _arg_1)
            {
                this._1245447980pointIcon5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pointIcon5", _local_2, _arg_1));
            };
        }

        public function set pointIcon3(_arg_1:Image):void
        {
            var _local_2:Object = this._1245447978pointIcon3;
            if (_local_2 !== _arg_1)
            {
                this._1245447978pointIcon3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "pointIcon3", _local_2, _arg_1));
            };
        }

        public function set panelTitle(_arg_1:BasicTitleCanvas):void
        {
            var _local_2:Object = this._1287834292panelTitle;
            if (_local_2 !== _arg_1)
            {
                this._1287834292panelTitle = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "panelTitle", _local_2, _arg_1));
            };
        }

        public function set btnPointsAward(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._2132384574btnPointsAward;
            if (_local_2 !== _arg_1)
            {
                this._2132384574btnPointsAward = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnPointsAward", _local_2, _arg_1));
            };
        }

        public function set bordername(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1825700023bordername;
            if (_local_2 !== _arg_1)
            {
                this._1825700023bordername = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bordername", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get firstoccupy():RoundedLabel
        {
            return (this._247605121firstoccupy);
        }

        public function set boosstate(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._2022655936boosstate;
            if (_local_2 !== _arg_1)
            {
                this._2022655936boosstate = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "boosstate", _local_2, _arg_1));
            };
        }

        public function set occypy4(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1636875839occypy4;
            if (_local_2 !== _arg_1)
            {
                this._1636875839occypy4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "occypy4", _local_2, _arg_1));
            };
        }

        public function set occypy3(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1636875840occypy3;
            if (_local_2 !== _arg_1)
            {
                this._1636875840occypy3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "occypy3", _local_2, _arg_1));
            };
        }

        public function set occypy1(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1636875842occypy1;
            if (_local_2 !== _arg_1)
            {
                this._1636875842occypy1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "occypy1", _local_2, _arg_1));
            };
        }

        public function set occypy2(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1636875841occypy2;
            if (_local_2 !== _arg_1)
            {
                this._1636875841occypy2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "occypy2", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:CrossContentionSingleInfoPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _CrossContentionSingleInfoPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_CrossContentionSingleInfoPanelWatcherSetupUtil");
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

        public function set occypy5(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1636875838occypy5;
            if (_local_2 !== _arg_1)
            {
                this._1636875838occypy5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "occypy5", _local_2, _arg_1));
            };
        }

        private function _CrossContentionSingleInfoPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                panelTitle.text = _arg_1;
            }, "panelTitle.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[13];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                areaname.htmlText = _arg_1;
            }, "areaname.htmlText");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                firstoccupy.htmlText = _arg_1;
            }, "firstoccupy.htmlText");
            result[2] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[19];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                currentlord.htmlText = _arg_1;
            }, "currentlord.htmlText");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                boosstate.htmlText = _arg_1;
            }, "boosstate.htmlText");
            result[4] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[23];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionSingleInfoPanel_RoundedLabel5.htmlText = _arg_1;
            }, "_CrossContentionSingleInfoPanel_RoundedLabel5.htmlText");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[23];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                bordername.htmlText = _arg_1;
            }, "bordername.htmlText");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[24];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionSingleInfoPanel_RoundedLabel7.htmlText = _arg_1;
            }, "_CrossContentionSingleInfoPanel_RoundedLabel7.htmlText");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[25];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionSingleInfoPanel_RoundedLabel8.htmlText = _arg_1;
            }, "_CrossContentionSingleInfoPanel_RoundedLabel8.htmlText");
            result[8] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[26];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionSingleInfoPanel_RoundedLabel9.htmlText = _arg_1;
            }, "_CrossContentionSingleInfoPanel_RoundedLabel9.htmlText");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[28];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                btnPointsAward.label = _arg_1;
            }, "btnPointsAward.label");
            result[10] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_CONTENTION_PANEL_U[27];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossContentionSingleInfoPanel_LinkButton1.label = _arg_1;
            }, "_CrossContentionSingleInfoPanel_LinkButton1.label");
            result[11] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get areaname():RoundedLabel
        {
            return (this._1665385320areaname);
        }

        [Bindable(event="propertyChange")]
        public function get areaIcon():Image
        {
            return (this._1666485594areaIcon);
        }

        public function onGetCrossContentionSingleState(_arg_1:Object):void
        {
            var _local_2:String;
            var _local_10:int;
            this.visible = true;
            mapData = _arg_1;
            if (_arg_1.lvlType)
            {
                CrossContentionTotalPanel.LEVLE_TYPE = _arg_1.lvlType;
            };
            if (_arg_1.mid)
            {
                this["areaname"].htmlText = Language.CROSS_CONTENTION_PANEL_U[13].toString().replace("{name}", GamePredef.CROSS_CONTENTION_MAP[_arg_1.mid].name);
                areaIcon.source = ResManager.getIconUrl(areaUrl[GamePredef.CROSS_CONTENTION_MAP_REC_INIT[_arg_1.mid]]);
            };
            if (_arg_1.mData.fosid)
            {
                _local_2 = CrossContentionTotalPanel.getServerName(Number(_arg_1.mData.fosid));
                this["firstoccupy"].htmlText = Language.CROSS_CONTENTION_PANEL_U[14].toString().replace("{name}", Language.CROSS_CONTENTION_PANEL_U[16].toString().replace("{osid}", _local_2));
                firstoccupy.toolTip = CrossContentionTotalPanel.getUnitServersName(Number(_arg_1.mData.fosid));
            }
            else
            {
                firstoccupy.toolTip = "";
                this["firstoccupy"].htmlText = Language.CROSS_CONTENTION_PANEL_U[14].toString().replace("{name}", Language.CROSS_CONTENTION_PANEL_U[15].toString());
            };
            if (_arg_1.osid)
            {
                _local_2 = CrossContentionTotalPanel.getServerName(Number(_arg_1.osid));
                this["currentlord"].htmlText = Language.CROSS_CONTENTION_PANEL_U[19].toString().replace("{name}", Language.CROSS_CONTENTION_PANEL_U[16].toString().replace("{osid}", _local_2));
                currentlord.toolTip = CrossContentionTotalPanel.getUnitServersName(Number(_arg_1.osid));
            }
            else
            {
                currentlord.toolTip = "";
                this["currentlord"].htmlText = Language.CROSS_CONTENTION_PANEL_U[19].toString().replace("{name}", Language.CROSS_CONTENTION_PANEL_U[17].toString());
            };
            var _local_3:int = -1;
            if (((_arg_1.boss) && (!(_arg_1.boss.bIndex == null))))
            {
                _local_3 = int(_arg_1.boss.bIndex);
            };
            if (((((!(_local_3 == -1)) && (_arg_1.boss)) && (_arg_1.boss.data[_local_3])) && (int(_arg_1.boss.data[_local_3].state) == 2)))
            {
                this["boosstate"].htmlText = Language.CROSS_CONTENTION_PANEL_U[20].toString().replace("{state}", Language.CROSS_CONTENTION_PANEL_U[21].toString()).replace("{color}", "#FF0000");
            }
            else
            {
                this["boosstate"].htmlText = Language.CROSS_CONTENTION_PANEL_U[20].toString().replace("{state}", Language.CROSS_CONTENTION_PANEL_U[22].toString()).replace("{color}", "#00FF00");
            };
            var _local_4:* = "";
            _local_4 = GamePredef.CROSS_CONTENTION_MAP[GamePredef.CROSS_CONTENTION_MAP_LINK[_arg_1.mid][0]].name;
            var _local_5:int = 1;
            while (_local_5 < GamePredef.CROSS_CONTENTION_MAP_LINK[_arg_1.mid].length)
            {
                _local_4 = (_local_4 + ("," + GamePredef.CROSS_CONTENTION_MAP[GamePredef.CROSS_CONTENTION_MAP_LINK[_arg_1.mid][_local_5]].name));
                _local_5++;
            };
            this["bordername"].htmlText = _local_4;
            var _local_6:Array = [0, 0, 0, 0, 0, 0];
            var _local_7:Array = [0, 0, 0, 0, 0, 0];
            var _local_8:Object = GamePredef.CROSS_CONTENTION_REC_TEMP_DATA[GamePredef.CROSS_CONTENTION_MAP_REC_INIT[_arg_1.mid]];
            var _local_9:int = 1;
            while (_local_9 <= 100)
            {
                _local_10 = _local_8[_local_9].p;
                if (((_arg_1.mData[_local_9]) && (int(_arg_1.mData[_local_9].state1) == 1)))
                {
                    _local_6[_local_10]++;
                }
                else
                {
                    _local_7[_local_10]++;
                };
                _local_9++;
            };
            _local_5 = 1;
            while (_local_5 <= 5)
            {
                this[("occypy" + _local_5)].htmlText = String(_local_6[_local_5]);
                this[("unoccypy" + _local_5)].htmlText = String(_local_7[_local_5]);
                _local_5++;
            };
        }

        private function _CrossContentionSingleInfoPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[12];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[13];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[14];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[19];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[20];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[23];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[23];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[24];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[25];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[26];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[28];
            _local_1 = Language.CROSS_CONTENTION_PANEL_U[27];
        }

        [Bindable(event="propertyChange")]
        public function get panelTitle():BasicTitleCanvas
        {
            return (this._1287834292panelTitle);
        }

        private function howToPlay():void
        {
            if (_helpAlert)
            {
                PopUpManager.removePopUp(_helpAlert);
                _helpAlert = null;
            };
            var _local_1:String = Language.CROSS_CONTENTION_PANEL_U[29].toString();
            _helpAlert = Alert.show(_local_1, Language.CROSS_CONTENTION_PANEL_U[28].toString(), Alert.YES, null, null);
        }

        [Bindable(event="propertyChange")]
        public function get occypy3():RoundedLabel
        {
            return (this._1636875840occypy3);
        }

        [Bindable(event="propertyChange")]
        public function get occypy4():RoundedLabel
        {
            return (this._1636875839occypy4);
        }

        [Bindable(event="propertyChange")]
        public function get occypy5():RoundedLabel
        {
            return (this._1636875838occypy5);
        }

        [Bindable(event="propertyChange")]
        public function get occypy1():RoundedLabel
        {
            return (this._1636875842occypy1);
        }

        [Bindable(event="propertyChange")]
        public function get bordername():RoundedLabel
        {
            return (this._1825700023bordername);
        }

        [Bindable(event="propertyChange")]
        public function get occypy2():RoundedLabel
        {
            return (this._1636875841occypy2);
        }

        override public function initView():void
        {
            var _local_1:int;
            if (!inited)
            {
                inited = true;
                _local_1 = 1;
                while (_local_1 <= 5)
                {
                    this[("pointIcon" + _local_1)].source = ResManager.getIconUrl(CrossContentionIcon.iconUrls[_local_1]);
                    _local_1++;
                };
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
        }

        public function enter(_arg_1:Boolean=true):void
        {
            var _local_2:* = _core.view.getUI(ViewManager.PANEL_CROSS_CONTENTION_SINGLE);
            if (_local_2)
            {
                if (((mapData) && (mapData.mid)))
                {
                    _local_2.onGetCrossContentionSingleState(mapData);
                    if (((_arg_1) && (_core.player.inGroup)))
                    {
                        _core.remote.call("crossContentionOpenSinglePanel", null);
                    };
                }
                else
                {
                    _local_2.showPanel();
                };
            };
        }

        public function set currentlord(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._601956334currentlord;
            if (_local_2 !== _arg_1)
            {
                this._601956334currentlord = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "currentlord", _local_2, _arg_1));
            };
        }

        override public function set visible(_arg_1:Boolean):void
        {
            super.visible = _arg_1;
            if ((((_arg_1) && (_core.player)) && (_core.player.level < 50)))
            {
                return;
            };
            if (_arg_1)
            {
                initView();
            };
        }

        [Bindable(event="propertyChange")]
        public function get currentlord():RoundedLabel
        {
            return (this._601956334currentlord);
        }

        public function set firstoccupy(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._247605121firstoccupy;
            if (_local_2 !== _arg_1)
            {
                this._247605121firstoccupy = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "firstoccupy", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

