// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.MazeEventInfoPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Text;
    import mx.controls.Image;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.resource.ResManager;
    import mx.binding.Binding;
    import flash.utils.getDefinitionByName;
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

    use namespace mx_internal;

    public class MazeEventInfoPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _MazeEventInfoPanel_Text10:Text;
        public var _MazeEventInfoPanel_Text11:Text;
        public var _MazeEventInfoPanel_Text12:Text;
        public var _MazeEventInfoPanel_Text13:Text;
        public var _MazeEventInfoPanel_Text14:Text;
        public var _MazeEventInfoPanel_Image12:Image;
        public var _MazeEventInfoPanel_Image13:Image;
        public var _MazeEventInfoPanel_Image14:Image;
        public var _MazeEventInfoPanel_Image10:Image;
        public var _MazeEventInfoPanel_Image11:Image;
        public var _MazeEventInfoPanel_Image1:Image;
        public var _MazeEventInfoPanel_Image2:Image;
        public var _MazeEventInfoPanel_Image3:Image;
        public var _MazeEventInfoPanel_Image4:Image;
        public var _MazeEventInfoPanel_Image5:Image;
        public var _MazeEventInfoPanel_Image6:Image;
        public var _MazeEventInfoPanel_Text3:Text;
        public var _MazeEventInfoPanel_Text4:Text;
        public var _MazeEventInfoPanel_Image9:Image;
        public var _MazeEventInfoPanel_Text7:Text;
        public var _MazeEventInfoPanel_Text1:Text;
        public var _MazeEventInfoPanel_Text2:Text;
        public var _MazeEventInfoPanel_Image7:Image;
        public var _MazeEventInfoPanel_Image8:Image;
        public var _MazeEventInfoPanel_Text6:Text;
        public var _MazeEventInfoPanel_Text8:Text;
        public var _MazeEventInfoPanel_Text9:Text;
        public var _MazeEventInfoPanel_BasicTitleCanvas1:BasicTitleCanvas;
        public var _MazeEventInfoPanel_Text5:Text;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":580,
                    "height":410,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_MazeEventInfoPanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":275,
                                "height":50,
                                "x":15,
                                "y":40,
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":70,
                                            "height":50,
                                            "x":0,
                                            "y":0,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_MazeEventInfoPanel_Image1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":3,
                                                        "width":45,
                                                        "height":30
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":205,
                                            "height":50,
                                            "x":70,
                                            "y":0,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Text,
                                                "id":"_MazeEventInfoPanel_Text1",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0,
                                                        "y":0,
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "selectable":false
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
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":275,
                                "height":50,
                                "x":290,
                                "y":40,
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":70,
                                            "height":50,
                                            "x":0,
                                            "y":0,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_MazeEventInfoPanel_Image2",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":3,
                                                        "width":45,
                                                        "height":30
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":205,
                                            "height":50,
                                            "x":70,
                                            "y":0,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Text,
                                                "id":"_MazeEventInfoPanel_Text2",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0,
                                                        "y":0,
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "selectable":false
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
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":275,
                                "height":50,
                                "x":15,
                                "y":90,
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":70,
                                            "height":50,
                                            "x":0,
                                            "y":0,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_MazeEventInfoPanel_Image3",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":3,
                                                        "width":45,
                                                        "height":30
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":205,
                                            "height":50,
                                            "x":70,
                                            "y":0,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Text,
                                                "id":"_MazeEventInfoPanel_Text3",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0,
                                                        "y":0,
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "selectable":false
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
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":275,
                                "height":50,
                                "x":290,
                                "y":90,
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":70,
                                            "height":50,
                                            "x":0,
                                            "y":0,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_MazeEventInfoPanel_Image4",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":3,
                                                        "width":45,
                                                        "height":30
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":205,
                                            "height":50,
                                            "x":70,
                                            "y":0,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Text,
                                                "id":"_MazeEventInfoPanel_Text4",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0,
                                                        "y":0,
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "selectable":false
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
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":275,
                                "height":50,
                                "x":15,
                                "y":140,
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":70,
                                            "height":50,
                                            "x":0,
                                            "y":0,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_MazeEventInfoPanel_Image5",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":3,
                                                        "width":45,
                                                        "height":30
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":205,
                                            "height":50,
                                            "x":70,
                                            "y":0,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Text,
                                                "id":"_MazeEventInfoPanel_Text5",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0,
                                                        "y":0,
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "selectable":false
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
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":275,
                                "height":50,
                                "x":290,
                                "y":140,
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":70,
                                            "height":50,
                                            "x":0,
                                            "y":0,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_MazeEventInfoPanel_Image6",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":3,
                                                        "width":45,
                                                        "height":30
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":205,
                                            "height":50,
                                            "x":70,
                                            "y":0,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Text,
                                                "id":"_MazeEventInfoPanel_Text6",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0,
                                                        "y":0,
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "selectable":false
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
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":275,
                                "height":50,
                                "x":15,
                                "y":190,
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":70,
                                            "height":50,
                                            "x":0,
                                            "y":0,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_MazeEventInfoPanel_Image7",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":3,
                                                        "width":45,
                                                        "height":30
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":205,
                                            "height":50,
                                            "x":70,
                                            "y":0,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Text,
                                                "id":"_MazeEventInfoPanel_Text7",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0,
                                                        "y":0,
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "selectable":false
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
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":275,
                                "height":50,
                                "x":290,
                                "y":190,
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":70,
                                            "height":50,
                                            "x":0,
                                            "y":0,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_MazeEventInfoPanel_Image8",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":3,
                                                        "width":45,
                                                        "height":30
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":205,
                                            "height":50,
                                            "x":70,
                                            "y":0,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Text,
                                                "id":"_MazeEventInfoPanel_Text8",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0,
                                                        "y":0,
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "selectable":false
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
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":275,
                                "height":50,
                                "x":15,
                                "y":240,
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":70,
                                            "height":50,
                                            "x":0,
                                            "y":0,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_MazeEventInfoPanel_Image9",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":3,
                                                        "width":45,
                                                        "height":30
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":205,
                                            "height":50,
                                            "x":70,
                                            "y":0,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Text,
                                                "id":"_MazeEventInfoPanel_Text9",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0,
                                                        "y":0,
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "selectable":false
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
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":275,
                                "height":50,
                                "x":290,
                                "y":240,
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":70,
                                            "height":50,
                                            "x":0,
                                            "y":0,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_MazeEventInfoPanel_Image10",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":3,
                                                        "width":45,
                                                        "height":30
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":205,
                                            "height":50,
                                            "x":70,
                                            "y":0,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Text,
                                                "id":"_MazeEventInfoPanel_Text10",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0,
                                                        "y":0,
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "selectable":false
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
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":275,
                                "height":50,
                                "x":15,
                                "y":290,
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":70,
                                            "height":50,
                                            "x":0,
                                            "y":0,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_MazeEventInfoPanel_Image11",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":3,
                                                        "width":45,
                                                        "height":30
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":205,
                                            "height":50,
                                            "x":70,
                                            "y":0,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Text,
                                                "id":"_MazeEventInfoPanel_Text11",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0,
                                                        "y":0,
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "selectable":false
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
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":275,
                                "height":50,
                                "x":290,
                                "y":290,
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":70,
                                            "height":50,
                                            "x":0,
                                            "y":0,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_MazeEventInfoPanel_Image12",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":3,
                                                        "width":45,
                                                        "height":30
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":205,
                                            "height":50,
                                            "x":70,
                                            "y":0,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Text,
                                                "id":"_MazeEventInfoPanel_Text12",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0,
                                                        "y":0,
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "selectable":false
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
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":275,
                                "height":50,
                                "x":15,
                                "y":340,
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":70,
                                            "height":50,
                                            "x":0,
                                            "y":0,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_MazeEventInfoPanel_Image13",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":3,
                                                        "width":45,
                                                        "height":30
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":205,
                                            "height":50,
                                            "x":70,
                                            "y":0,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Text,
                                                "id":"_MazeEventInfoPanel_Text13",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0,
                                                        "y":0,
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "selectable":false
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
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":275,
                                "height":50,
                                "x":290,
                                "y":340,
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":70,
                                            "height":50,
                                            "x":0,
                                            "y":0,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Image,
                                                "id":"_MazeEventInfoPanel_Image14",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":10,
                                                        "y":3,
                                                        "width":45,
                                                        "height":30
                                                    });
                                                }
                                            })]
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":205,
                                            "height":50,
                                            "x":70,
                                            "y":0,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Text,
                                                "id":"_MazeEventInfoPanel_Text14",
                                                "stylesFactory":function ():void
                                                {
                                                    this.color = 0xFFFFFF;
                                                },
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "x":0,
                                                        "y":0,
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "selectable":false
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
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function MazeEventInfoPanel()
        {
            mx_internal::_document = this;
            this.width = 580;
            this.height = 410;
            this.styleName = "StandardContent";
            this.cacheAsBitmap = true;
            this.addEventListener("creationComplete", ___MazeEventInfoPanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            MazeEventInfoPanel._watcherSetupUtil = _arg_1;
        }


        private function _MazeEventInfoPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.MAZE_EVENT_INFO_PANEL_U[0];
            _local_1 = ResManager.getIconUrl(3060100001196);
            _local_1 = Language.MAZE_EVENT_INFO_PANEL_U[2];
            _local_1 = ResManager.getIconUrl(3060100001193);
            _local_1 = Language.MAZE_EVENT_INFO_PANEL_U[16];
            _local_1 = ResManager.getIconUrl(3060100001189);
            _local_1 = Language.MAZE_EVENT_INFO_PANEL_U[4];
            _local_1 = ResManager.getIconUrl(3060100001192);
            _local_1 = Language.MAZE_EVENT_INFO_PANEL_U[18];
            _local_1 = ResManager.getIconUrl(3060100001191);
            _local_1 = Language.MAZE_EVENT_INFO_PANEL_U[6];
            _local_1 = ResManager.getIconUrl(3060100001194);
            _local_1 = Language.MAZE_EVENT_INFO_PANEL_U[20];
            _local_1 = ResManager.getIconUrl(3060100001195);
            _local_1 = Language.MAZE_EVENT_INFO_PANEL_U[8];
            _local_1 = ResManager.getIconUrl(3060100001197);
            _local_1 = Language.MAZE_EVENT_INFO_PANEL_U[22];
            _local_1 = ResManager.getIconUrl(3060100001190);
            _local_1 = Language.MAZE_EVENT_INFO_PANEL_U[10];
            _local_1 = ResManager.getIconUrl(3060100001198);
            _local_1 = Language.MAZE_EVENT_INFO_PANEL_U[24];
            _local_1 = ResManager.getIconUrl(3060100001199);
            _local_1 = Language.MAZE_EVENT_INFO_PANEL_U[12];
            _local_1 = ResManager.getIconUrl(3060100001200);
            _local_1 = Language.MAZE_EVENT_INFO_PANEL_U[26];
            _local_1 = ResManager.getIconUrl(3060100001187);
            _local_1 = Language.MAZE_EVENT_INFO_PANEL_U[14];
            _local_1 = ResManager.getIconUrl(3060100001188);
            _local_1 = Language.MAZE_EVENT_INFO_PANEL_U[28];
        }

        public function showPanel():void
        {
            this.visible = true;
        }

        private function _MazeEventInfoPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_EVENT_INFO_PANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MazeEventInfoPanel_BasicTitleCanvas1.text = _arg_1;
            }, "_MazeEventInfoPanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(3060100001196));
            }, function (_arg_1:Object):void
            {
                _MazeEventInfoPanel_Image1.source = _arg_1;
            }, "_MazeEventInfoPanel_Image1.source");
            result[1] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_EVENT_INFO_PANEL_U[2];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MazeEventInfoPanel_Text1.text = _arg_1;
            }, "_MazeEventInfoPanel_Text1.text");
            result[2] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(3060100001193));
            }, function (_arg_1:Object):void
            {
                _MazeEventInfoPanel_Image2.source = _arg_1;
            }, "_MazeEventInfoPanel_Image2.source");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_EVENT_INFO_PANEL_U[16];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MazeEventInfoPanel_Text2.text = _arg_1;
            }, "_MazeEventInfoPanel_Text2.text");
            result[4] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(3060100001189));
            }, function (_arg_1:Object):void
            {
                _MazeEventInfoPanel_Image3.source = _arg_1;
            }, "_MazeEventInfoPanel_Image3.source");
            result[5] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_EVENT_INFO_PANEL_U[4];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MazeEventInfoPanel_Text3.text = _arg_1;
            }, "_MazeEventInfoPanel_Text3.text");
            result[6] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(3060100001192));
            }, function (_arg_1:Object):void
            {
                _MazeEventInfoPanel_Image4.source = _arg_1;
            }, "_MazeEventInfoPanel_Image4.source");
            result[7] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_EVENT_INFO_PANEL_U[18];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MazeEventInfoPanel_Text4.text = _arg_1;
            }, "_MazeEventInfoPanel_Text4.text");
            result[8] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(3060100001191));
            }, function (_arg_1:Object):void
            {
                _MazeEventInfoPanel_Image5.source = _arg_1;
            }, "_MazeEventInfoPanel_Image5.source");
            result[9] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_EVENT_INFO_PANEL_U[6];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MazeEventInfoPanel_Text5.text = _arg_1;
            }, "_MazeEventInfoPanel_Text5.text");
            result[10] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(3060100001194));
            }, function (_arg_1:Object):void
            {
                _MazeEventInfoPanel_Image6.source = _arg_1;
            }, "_MazeEventInfoPanel_Image6.source");
            result[11] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_EVENT_INFO_PANEL_U[20];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MazeEventInfoPanel_Text6.text = _arg_1;
            }, "_MazeEventInfoPanel_Text6.text");
            result[12] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(3060100001195));
            }, function (_arg_1:Object):void
            {
                _MazeEventInfoPanel_Image7.source = _arg_1;
            }, "_MazeEventInfoPanel_Image7.source");
            result[13] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_EVENT_INFO_PANEL_U[8];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MazeEventInfoPanel_Text7.text = _arg_1;
            }, "_MazeEventInfoPanel_Text7.text");
            result[14] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(3060100001197));
            }, function (_arg_1:Object):void
            {
                _MazeEventInfoPanel_Image8.source = _arg_1;
            }, "_MazeEventInfoPanel_Image8.source");
            result[15] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_EVENT_INFO_PANEL_U[22];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MazeEventInfoPanel_Text8.text = _arg_1;
            }, "_MazeEventInfoPanel_Text8.text");
            result[16] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(3060100001190));
            }, function (_arg_1:Object):void
            {
                _MazeEventInfoPanel_Image9.source = _arg_1;
            }, "_MazeEventInfoPanel_Image9.source");
            result[17] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_EVENT_INFO_PANEL_U[10];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MazeEventInfoPanel_Text9.text = _arg_1;
            }, "_MazeEventInfoPanel_Text9.text");
            result[18] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(3060100001198));
            }, function (_arg_1:Object):void
            {
                _MazeEventInfoPanel_Image10.source = _arg_1;
            }, "_MazeEventInfoPanel_Image10.source");
            result[19] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_EVENT_INFO_PANEL_U[24];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MazeEventInfoPanel_Text10.text = _arg_1;
            }, "_MazeEventInfoPanel_Text10.text");
            result[20] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(3060100001199));
            }, function (_arg_1:Object):void
            {
                _MazeEventInfoPanel_Image11.source = _arg_1;
            }, "_MazeEventInfoPanel_Image11.source");
            result[21] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_EVENT_INFO_PANEL_U[12];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MazeEventInfoPanel_Text11.text = _arg_1;
            }, "_MazeEventInfoPanel_Text11.text");
            result[22] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(3060100001200));
            }, function (_arg_1:Object):void
            {
                _MazeEventInfoPanel_Image12.source = _arg_1;
            }, "_MazeEventInfoPanel_Image12.source");
            result[23] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_EVENT_INFO_PANEL_U[26];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MazeEventInfoPanel_Text12.text = _arg_1;
            }, "_MazeEventInfoPanel_Text12.text");
            result[24] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(3060100001187));
            }, function (_arg_1:Object):void
            {
                _MazeEventInfoPanel_Image13.source = _arg_1;
            }, "_MazeEventInfoPanel_Image13.source");
            result[25] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_EVENT_INFO_PANEL_U[14];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MazeEventInfoPanel_Text13.text = _arg_1;
            }, "_MazeEventInfoPanel_Text13.text");
            result[26] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(3060100001188));
            }, function (_arg_1:Object):void
            {
                _MazeEventInfoPanel_Image14.source = _arg_1;
            }, "_MazeEventInfoPanel_Image14.source");
            result[27] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_EVENT_INFO_PANEL_U[28];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MazeEventInfoPanel_Text14.text = _arg_1;
            }, "_MazeEventInfoPanel_Text14.text");
            result[28] = binding;
            return (result);
        }

        override public function initialize():void
        {
            var target:MazeEventInfoPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _MazeEventInfoPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_MazeEventInfoPanelWatcherSetupUtil");
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

        public function ___MazeEventInfoPanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initView();
        }

        override public function initView():void
        {
        }


    }
}//package com.qeedoo.ui.view.compDragable

