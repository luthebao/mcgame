// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.GuildWarehousePanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.ItemSlot;
    import mx.containers.Tile;
    import mx.containers.ViewStack;
    import mx.containers.Canvas;
    import com.qeedoo.ui.view.comp.BasicGlowButton;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.core.UIComponentDescriptor;
    import com.qeedoo.ui.view.comp.SimpleCanvas;
    import mx.containers.HBox;
    import com.qeedoo.game.data.DataManager;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.events.MouseEvent;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.view.comp.Slot;
    import com.qeedoo.game.predef.GamePredef;
    import mx.binding.Binding;
    import com.qeedoo.ui.utils.ToolKit;
    import flash.utils.getDefinitionByName;
    import mx.events.FlexEvent;
    import flash.net.Responder;
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

    public class GuildWarehousePanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _899454695slot50:ItemSlot;
        private var _899454782slot26:ItemSlot;
        private var _899454754slot33:ItemSlot;
        private var _899454726slot40:ItemSlot;
        private var _109532667slot9:ItemSlot;
        private var _899454813slot16:ItemSlot;
        private var _133022078firstTile:Tile;
        private var _2113295533slot111:ItemSlot;
        private var _2113295562slot103:ItemSlot;
        private var _110471982tnBag:ViewStack;
        private var _899454689slot56:ItemSlot;
        private var _899454748slot39:ItemSlot;
        private var _899454600slot82:ItemSlot;
        private var _899454787slot21:ItemSlot;
        private var _109532661slot3:ItemSlot;
        private var _899454818slot11:ItemSlot;
        public var _GuildWarehousePanel_Canvas1:Canvas;
        private var _899454563slot98:ItemSlot;
        private var _899454661slot63:ItemSlot;
        private var _899454633slot70:ItemSlot;
        private var _899454720slot46:ItemSlot;
        private var _1554141557tabBtn2:BasicGlowButton;
        private var _2113295527slot117:ItemSlot;
        private var _2113295556slot109:ItemSlot;
        private var _899454568slot93:ItemSlot;
        private var _899454655slot69:ItemSlot;
        private var _899454627slot76:ItemSlot;
        private var _899454596slot86:ItemSlot;
        private var _899454694slot51:ItemSlot;
        private var _899454781slot27:ItemSlot;
        private var _899454753slot34:ItemSlot;
        private var _899454725slot41:ItemSlot;
        private var _899454812slot17:ItemSlot;
        private var _899454688slot57:ItemSlot;
        private var _109532662slot4:ItemSlot;
        private var _899454719slot47:ItemSlot;
        private var _2113295534slot110:ItemSlot;
        private var _2113295563slot102:ItemSlot;
        private var _899454786slot22:ItemSlot;
        private var _899454817slot12:ItemSlot;
        private var _899454562slot99:ItemSlot;
        private var _899454660slot64:ItemSlot;
        private var _899454632slot71:ItemSlot;
        private var _899454595slot87:ItemSlot;
        private var _899454567slot94:ItemSlot;
        private var _899454626slot77:ItemSlot;
        private var _2113295528slot116:ItemSlot;
        private var _423866690secondTile:Tile;
        private var _899454693slot52:ItemSlot;
        private var _2113295530slot114:ItemSlot;
        private var _1554141558tabBtn1:BasicGlowButton;
        private var _899454780slot28:ItemSlot;
        private var _899454724slot42:ItemSlot;
        private var _109532663slot5:ItemSlot;
        private var _2113295557slot108:ItemSlot;
        private var _899454811slot18:ItemSlot;
        private var _899454752slot35:ItemSlot;
        private var _899454687slot58:ItemSlot;
        private var _899454659slot65:ItemSlot;
        private var _899454718slot48:ItemSlot;
        private var _3648t4:Tile;
        private var _899454785slot23:ItemSlot;
        private var _899454757slot30:ItemSlot;
        private var _899454816slot13:ItemSlot;
        private var _2113295564slot101:ItemSlot;
        private var _899454779slot29:ItemSlot;
        private var _109532659slot1:ItemSlot;
        private var _899454631slot72:ItemSlot;
        private var _899454566slot95:ItemSlot;
        private var _585350987thirdTile:Tile;
        private var _899454594slot88:ItemSlot;
        private var _109532664slot6:ItemSlot;
        private var _899454625slot78:ItemSlot;
        private var _899454692slot53:ItemSlot;
        private var _899454664slot60:ItemSlot;
        private var _899454751slot36:ItemSlot;
        private var _899454723slot43:ItemSlot;
        private var _1554141559tabBtn0:BasicGlowButton;
        private var _899454810slot19:ItemSlot;
        public var _GuildWarehousePanel_Label1:Label;
        private var _2113295529slot115:ItemSlot;
        private var _2113295531slot113:ItemSlot;
        private var _899454599slot83:ItemSlot;
        private var _2113295558slot107:ItemSlot;
        private var _899454686slot59:ItemSlot;
        private var _899454658slot66:ItemSlot;
        private var _2113295560slot105:ItemSlot;
        private var _899454717slot49:ItemSlot;
        private var _899454784slot24:ItemSlot;
        private var _899454756slot31:ItemSlot;
        private var _899454815slot14:ItemSlot;
        private var firstTimeFlag:Boolean = true;
        public var _GuildWarehousePanel_BasicTitleCanvas1:BasicTitleCanvas;
        private var _899454571slot90:ItemSlot;
        private var _2113295565slot100:ItemSlot;
        private var _899454630slot73:ItemSlot;
        private var _899454602slot80:ItemSlot;
        private var _109532665slot7:ItemSlot;
        private var _2113295525slot119:ItemSlot;
        private var _899454593slot89:ItemSlot;
        private var _899454565slot96:ItemSlot;
        private var _899454624slot79:ItemSlot;
        private var _899454691slot54:ItemSlot;
        private var _899454663slot61:ItemSlot;
        private var _899454722slot44:ItemSlot;
        private var _899454750slot37:ItemSlot;
        private var _1180008724secondCanvas:Canvas;
        private var _899454598slot84:ItemSlot;
        private var _899454657slot67:ItemSlot;
        private var _899454629slot74:ItemSlot;
        private var _2113295503slot120:ItemSlot;
        private var _2113295532slot112:ItemSlot;
        private var _2113295561slot104:ItemSlot;
        private var _899454783slot25:ItemSlot;
        private var _899454755slot32:ItemSlot;
        private var _2113295559slot106:ItemSlot;
        private var _899454814slot15:ItemSlot;
        private var _375587425thirdCanvas:Canvas;
        private var _109532666slot8:ItemSlot;
        private var _899454749slot38:ItemSlot;
        private var _899454570slot91:ItemSlot;
        private var _899454601slot81:ItemSlot;
        private var _899454788slot20:ItemSlot;
        private var _899454819slot10:ItemSlot;
        private var _162384312fouthCanvas:Canvas;
        private var _899454564slot97:ItemSlot;
        private var _109532660slot2:ItemSlot;
        private var _1554141556tabBtn3:BasicGlowButton;
        private var _2113295526slot118:ItemSlot;
        private var _899454690slot55:ItemSlot;
        private var _899454662slot62:ItemSlot;
        private var _899454721slot45:ItemSlot;
        private var _899454597slot85:ItemSlot;
        private var _899454569slot92:ItemSlot;
        private var _899454656slot68:ItemSlot;
        private var _899454628slot75:ItemSlot;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":270,
                    "height":280,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_GuildWarehousePanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":SimpleCanvas,
                        "stylesFactory":function ():void
                        {
                            this.top = "60";
                            this.bottom = "15";
                            this.left = "15";
                            this.right = "15";
                            this.backgroundAlpha = 1;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":ViewStack,
                                    "id":"tnBag",
                                    "stylesFactory":function ():void
                                    {
                                        this.top = "3";
                                        this.left = "4";
                                        this.right = "4";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "creationPolicy":"all",
                                            "percentHeight":100,
                                            "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"_GuildWarehousePanel_Canvas1",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Tile,
                                                            "id":"firstTile",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.verticalGap = 1;
                                                                this.horizontalGap = 3;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":0,
                                                                    "y":1,
                                                                    "percentWidth":100,
                                                                    "percentHeight":100,
                                                                    "direction":"horizontal",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "verticalScrollPolicy":"off",
                                                                    "styleName":"TileSlot",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot1",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":501});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot2",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":502});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot3",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":503});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot4",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":504});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot5",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":505});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot6",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":506});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot7",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":507});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot8",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":508});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot9",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":509});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot10",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":510});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot11",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":511});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot12",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":0x0200});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot13",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":513});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot14",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":0x0202});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot15",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":515});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot16",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":516});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot17",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":517});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot18",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":518});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot19",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":519});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot20",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":520});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot21",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":521});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot22",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":522});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot23",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":523});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot24",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":524});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot25",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":525});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot26",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":526});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot27",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":527});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot28",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":528});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot29",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":529});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot30",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":530});
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"secondCanvas",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Tile,
                                                            "id":"secondTile",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.verticalGap = 1;
                                                                this.horizontalGap = 3;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":0,
                                                                    "y":0,
                                                                    "percentWidth":100,
                                                                    "percentHeight":100,
                                                                    "direction":"horizontal",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "verticalScrollPolicy":"off",
                                                                    "styleName":"TileSlot",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot31",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":531});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot32",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":532});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot33",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":533});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot34",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":534});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot35",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":535});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot36",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":536});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot37",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":537});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot38",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":538});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot39",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":539});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot40",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":540});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot41",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":541});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot42",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":542});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot43",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":543});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot44",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":544});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot45",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":545});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot46",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":546});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot47",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":547});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot48",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":548});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot49",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":549});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot50",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":550});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot51",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":551});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot52",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":552});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot53",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":553});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot54",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":554});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot55",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":555});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot56",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":556});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot57",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":557});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot58",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":558});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot59",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":559});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot60",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":560});
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"thirdCanvas",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Tile,
                                                            "id":"thirdTile",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.verticalGap = 1;
                                                                this.horizontalGap = 3;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":0,
                                                                    "y":0,
                                                                    "percentWidth":100,
                                                                    "percentHeight":100,
                                                                    "direction":"horizontal",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "verticalScrollPolicy":"off",
                                                                    "styleName":"TileSlot",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot61",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":561});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot62",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":562});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot63",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":563});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot64",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":564});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot65",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":565});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot66",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":566});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot67",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":567});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot68",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":568});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot69",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":569});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot70",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":570});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot71",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":571});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot72",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":572});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot73",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":573});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot74",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":574});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot75",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":575});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot76",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":576});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot77",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":577});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot78",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":578});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot79",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":579});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot80",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":580});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot81",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":581});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot82",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":582});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot83",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":583});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot84",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":584});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot85",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":585});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot86",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":586});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot87",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":587});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot88",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":588});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot89",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":589});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot90",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":590});
                                                                        }
                                                                    })]
                                                                });
                                                            }
                                                        })]
                                                    });
                                                }
                                            }), new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"fouthCanvas",
                                                "propertiesFactory":function ():Object
                                                {
                                                    return ({
                                                        "percentWidth":100,
                                                        "percentHeight":100,
                                                        "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Tile,
                                                            "id":"t4",
                                                            "stylesFactory":function ():void
                                                            {
                                                                this.verticalGap = 1;
                                                                this.horizontalGap = 3;
                                                            },
                                                            "propertiesFactory":function ():Object
                                                            {
                                                                return ({
                                                                    "x":0,
                                                                    "y":0,
                                                                    "percentWidth":100,
                                                                    "percentHeight":100,
                                                                    "direction":"horizontal",
                                                                    "horizontalScrollPolicy":"off",
                                                                    "verticalScrollPolicy":"off",
                                                                    "styleName":"TileSlot",
                                                                    "childDescriptors":[new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot91",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":591});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot92",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":592});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot93",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":593});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot94",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":594});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot95",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":595});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot96",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":596});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot97",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":597});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot98",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":598});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot99",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":599});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot100",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":600});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot101",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":601});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot102",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":602});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot103",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":603});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot104",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":604});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot105",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":605});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot106",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":606});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot107",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":607});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot108",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":608});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot109",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":609});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot110",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":610});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot111",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":611});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot112",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":612});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot113",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":613});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot114",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":614});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot115",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":615});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot116",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":616});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot117",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":617});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot118",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":618});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot119",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":619});
                                                                        }
                                                                    }), new UIComponentDescriptor({
                                                                        "type":ItemSlot,
                                                                        "id":"slot120",
                                                                        "propertiesFactory":function ():Object
                                                                        {
                                                                            return ({"index":620});
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
                                    "type":Label,
                                    "id":"_GuildWarehousePanel_Label1",
                                    "stylesFactory":function ():void
                                    {
                                        this.bottom = "2";
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":169,
                                            "styleName":"DescriptionText",
                                            "x":34
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":HBox,
                        "stylesFactory":function ():void
                        {
                            this.horizontalGap = 0;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":25,
                                "y":40,
                                "styleName":"HTabWrapper",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tabBtn0",
                                    "events":{"click":"__tabBtn0_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "selected":true,
                                            "width":39
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tabBtn1",
                                    "events":{"click":"__tabBtn1_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "enabled":false,
                                            "width":39
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tabBtn2",
                                    "events":{"click":"__tabBtn2_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "enabled":false,
                                            "width":39
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":BasicGlowButton,
                                    "id":"tabBtn3",
                                    "events":{"click":"__tabBtn3_click"},
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "styleName":"HorizontalTab",
                                            "enabled":false,
                                            "width":39
                                        });
                                    }
                                })]
                            });
                        }
                    })]
                });
            }
        });
        private var _dm:DataManager = DataManager.getInstance();
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function GuildWarehousePanel()
        {
            mx_internal::_document = this;
            this.width = 270;
            this.height = 280;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            GuildWarehousePanel._watcherSetupUtil = _arg_1;
        }


        public function set slot9(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._109532667slot9;
            if (_local_2 !== _arg_1)
            {
                this._109532667slot9 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot9", _local_2, _arg_1));
            };
        }

        public function __tabBtn0_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(0);
        }

        public function set t4(_arg_1:Tile):void
        {
            var _local_2:Object = this._3648t4;
            if (_local_2 !== _arg_1)
            {
                this._3648t4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "t4", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot10():ItemSlot
        {
            return (this._899454819slot10);
        }

        [Bindable(event="propertyChange")]
        public function get slot11():ItemSlot
        {
            return (this._899454818slot11);
        }

        [Bindable(event="propertyChange")]
        public function get slot12():ItemSlot
        {
            return (this._899454817slot12);
        }

        [Bindable(event="propertyChange")]
        public function get slot14():ItemSlot
        {
            return (this._899454815slot14);
        }

        private function _GuildWarehousePanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.GUILDPANEL_U[17];
            _local_1 = Language.GUILDWAREHOUSRPANEL_U[0];
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Language.GUILDWAREHOUSRPANEL_U[0];
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Language.GUILDWAREHOUSRPANEL_U[0];
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Language.GUILDWAREHOUSRPANEL_U[0];
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Slot.SLOT_GUILD;
            _local_1 = Language.GUILDWAREHOUSRPANEL_U[1];
            _local_1 = Language.BANKPANEL_U[0];
            _local_1 = Language.BANKPANEL_U[0];
            _local_1 = Language.BANKPANEL_U[0];
            _local_1 = Language.BANKPANEL_U[0];
        }

        [Bindable(event="propertyChange")]
        public function get slot18():ItemSlot
        {
            return (this._899454811slot18);
        }

        [Bindable(event="propertyChange")]
        public function get slot19():ItemSlot
        {
            return (this._899454810slot19);
        }

        [Bindable(event="propertyChange")]
        public function get slot13():ItemSlot
        {
            return (this._899454816slot13);
        }

        [Bindable(event="propertyChange")]
        public function get slot15():ItemSlot
        {
            return (this._899454814slot15);
        }

        [Bindable(event="propertyChange")]
        public function get slot16():ItemSlot
        {
            return (this._899454813slot16);
        }

        [Bindable(event="propertyChange")]
        public function get slot17():ItemSlot
        {
            return (this._899454812slot17);
        }

        [Bindable(event="propertyChange")]
        public function get slot20():ItemSlot
        {
            return (this._899454788slot20);
        }

        [Bindable(event="propertyChange")]
        public function get slot23():ItemSlot
        {
            return (this._899454785slot23);
        }

        [Bindable(event="propertyChange")]
        public function get slot24():ItemSlot
        {
            return (this._899454784slot24);
        }

        [Bindable(event="propertyChange")]
        public function get slot25():ItemSlot
        {
            return (this._899454783slot25);
        }

        [Bindable(event="propertyChange")]
        public function get slot26():ItemSlot
        {
            return (this._899454782slot26);
        }

        [Bindable(event="propertyChange")]
        public function get slot28():ItemSlot
        {
            return (this._899454780slot28);
        }

        [Bindable(event="propertyChange")]
        public function get slot29():ItemSlot
        {
            return (this._899454779slot29);
        }

        [Bindable(event="propertyChange")]
        public function get slot27():ItemSlot
        {
            return (this._899454781slot27);
        }

        [Bindable(event="propertyChange")]
        public function get slot21():ItemSlot
        {
            return (this._899454787slot21);
        }

        [Bindable(event="propertyChange")]
        public function get slot22():ItemSlot
        {
            return (this._899454786slot22);
        }

        [Bindable(event="propertyChange")]
        public function get thirdTile():Tile
        {
            return (this._585350987thirdTile);
        }

        [Bindable(event="propertyChange")]
        public function get slot31():ItemSlot
        {
            return (this._899454756slot31);
        }

        [Bindable(event="propertyChange")]
        public function get slot32():ItemSlot
        {
            return (this._899454755slot32);
        }

        [Bindable(event="propertyChange")]
        public function get slot34():ItemSlot
        {
            return (this._899454753slot34);
        }

        [Bindable(event="propertyChange")]
        public function get slot36():ItemSlot
        {
            return (this._899454751slot36);
        }

        [Bindable(event="propertyChange")]
        public function get slot30():ItemSlot
        {
            return (this._899454757slot30);
        }

        override public function set visible(_arg_1:Boolean):void
        {
            super.visible = _arg_1;
            if (((_arg_1) && (firstTimeFlag)))
            {
                initView();
                firstTimeFlag = false;
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot33():ItemSlot
        {
            return (this._899454754slot33);
        }

        [Bindable(event="propertyChange")]
        public function get slot37():ItemSlot
        {
            return (this._899454750slot37);
        }

        [Bindable(event="propertyChange")]
        public function get slot35():ItemSlot
        {
            return (this._899454752slot35);
        }

        [Bindable(event="propertyChange")]
        public function get slot38():ItemSlot
        {
            return (this._899454749slot38);
        }

        [Bindable(event="propertyChange")]
        public function get slot39():ItemSlot
        {
            return (this._899454748slot39);
        }

        [Bindable(event="propertyChange")]
        public function get slot41():ItemSlot
        {
            return (this._899454725slot41);
        }

        [Bindable(event="propertyChange")]
        public function get slot44():ItemSlot
        {
            return (this._899454722slot44);
        }

        [Bindable(event="propertyChange")]
        public function get slot45():ItemSlot
        {
            return (this._899454721slot45);
        }

        [Bindable(event="propertyChange")]
        public function get slot46():ItemSlot
        {
            return (this._899454720slot46);
        }

        [Bindable(event="propertyChange")]
        public function get slot40():ItemSlot
        {
            return (this._899454726slot40);
        }

        [Bindable(event="propertyChange")]
        public function get slot48():ItemSlot
        {
            return (this._899454718slot48);
        }

        [Bindable(event="propertyChange")]
        public function get slot43():ItemSlot
        {
            return (this._899454723slot43);
        }

        [Bindable(event="propertyChange")]
        public function get slot47():ItemSlot
        {
            return (this._899454719slot47);
        }

        [Bindable(event="propertyChange")]
        public function get slot42():ItemSlot
        {
            return (this._899454724slot42);
        }

        [Bindable(event="propertyChange")]
        public function get slot49():ItemSlot
        {
            return (this._899454717slot49);
        }

        public function set tabBtn1(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141558tabBtn1;
            if (_local_2 !== _arg_1)
            {
                this._1554141558tabBtn1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn1", _local_2, _arg_1));
            };
        }

        public function set tabBtn2(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141557tabBtn2;
            if (_local_2 !== _arg_1)
            {
                this._1554141557tabBtn2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn2", _local_2, _arg_1));
            };
        }

        public function set tabBtn3(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141556tabBtn3;
            if (_local_2 !== _arg_1)
            {
                this._1554141556tabBtn3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn3", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot51():ItemSlot
        {
            return (this._899454694slot51);
        }

        [Bindable(event="propertyChange")]
        public function get slot52():ItemSlot
        {
            return (this._899454693slot52);
        }

        [Bindable(event="propertyChange")]
        public function get slot53():ItemSlot
        {
            return (this._899454692slot53);
        }

        [Bindable(event="propertyChange")]
        public function get slot54():ItemSlot
        {
            return (this._899454691slot54);
        }

        [Bindable(event="propertyChange")]
        public function get slot55():ItemSlot
        {
            return (this._899454690slot55);
        }

        [Bindable(event="propertyChange")]
        public function get slot56():ItemSlot
        {
            return (this._899454689slot56);
        }

        [Bindable(event="propertyChange")]
        public function get slot50():ItemSlot
        {
            return (this._899454695slot50);
        }

        [Bindable(event="propertyChange")]
        public function get slot58():ItemSlot
        {
            return (this._899454687slot58);
        }

        [Bindable(event="propertyChange")]
        public function get slot59():ItemSlot
        {
            return (this._899454686slot59);
        }

        [Bindable(event="propertyChange")]
        public function get slot57():ItemSlot
        {
            return (this._899454688slot57);
        }

        public function set tabBtn0(_arg_1:BasicGlowButton):void
        {
            var _local_2:Object = this._1554141559tabBtn0;
            if (_local_2 !== _arg_1)
            {
                this._1554141559tabBtn0 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tabBtn0", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot60():ItemSlot
        {
            return (this._899454664slot60);
        }

        [Bindable(event="propertyChange")]
        public function get slot61():ItemSlot
        {
            return (this._899454663slot61);
        }

        public function set slot10(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454819slot10;
            if (_local_2 !== _arg_1)
            {
                this._899454819slot10 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot10", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot63():ItemSlot
        {
            return (this._899454661slot63);
        }

        public function set slot11(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454818slot11;
            if (_local_2 !== _arg_1)
            {
                this._899454818slot11 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot11", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot65():ItemSlot
        {
            return (this._899454659slot65);
        }

        public function set slot12(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454817slot12;
            if (_local_2 !== _arg_1)
            {
                this._899454817slot12 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot12", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot67():ItemSlot
        {
            return (this._899454657slot67);
        }

        [Bindable(event="propertyChange")]
        public function get slot62():ItemSlot
        {
            return (this._899454662slot62);
        }

        [Bindable(event="propertyChange")]
        public function get secondTile():Tile
        {
            return (this._423866690secondTile);
        }

        [Bindable(event="propertyChange")]
        public function get slot64():ItemSlot
        {
            return (this._899454660slot64);
        }

        public function set slot15(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454814slot15;
            if (_local_2 !== _arg_1)
            {
                this._899454814slot15 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot15", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot66():ItemSlot
        {
            return (this._899454658slot66);
        }

        public function set slot13(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454816slot13;
            if (_local_2 !== _arg_1)
            {
                this._899454816slot13 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot13", _local_2, _arg_1));
            };
        }

        public function set slot17(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454812slot17;
            if (_local_2 !== _arg_1)
            {
                this._899454812slot17 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot17", _local_2, _arg_1));
            };
        }

        public function set slot14(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454815slot14;
            if (_local_2 !== _arg_1)
            {
                this._899454815slot14 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot14", _local_2, _arg_1));
            };
        }

        public function set slot18(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454811slot18;
            if (_local_2 !== _arg_1)
            {
                this._899454811slot18 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot18", _local_2, _arg_1));
            };
        }

        public function set slot19(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454810slot19;
            if (_local_2 !== _arg_1)
            {
                this._899454810slot19 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot19", _local_2, _arg_1));
            };
        }

        public function set slot16(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454813slot16;
            if (_local_2 !== _arg_1)
            {
                this._899454813slot16 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot16", _local_2, _arg_1));
            };
        }

        public function reset():void
        {
            var _local_2:*;
            firstTimeFlag = true;
            _dm.gsInited = false;
            tabBtn0.enabled = true;
            tabBtn1.enabled = false;
            tabBtn2.enabled = false;
            tabBtn3.enabled = false;
            var _local_1:int = (GamePredef.SLOT_SID_GUILD_BANK[0] + 1);
            while (_local_1 <= GamePredef.SLOT_SID_GUILD_BANK[4])
            {
                _local_2 = _core.view.getSlot(_local_1);
                if (_local_2 != null)
                {
                    _local_2.clean();
                };
                _local_1++;
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot69():ItemSlot
        {
            return (this._899454655slot69);
        }

        [Bindable(event="propertyChange")]
        public function get slot70():ItemSlot
        {
            return (this._899454633slot70);
        }

        [Bindable(event="propertyChange")]
        public function get slot68():ItemSlot
        {
            return (this._899454656slot68);
        }

        [Bindable(event="propertyChange")]
        public function get slot74():ItemSlot
        {
            return (this._899454629slot74);
        }

        [Bindable(event="propertyChange")]
        public function get slot75():ItemSlot
        {
            return (this._899454628slot75);
        }

        [Bindable(event="propertyChange")]
        public function get slot76():ItemSlot
        {
            return (this._899454627slot76);
        }

        [Bindable(event="propertyChange")]
        public function get slot77():ItemSlot
        {
            return (this._899454626slot77);
        }

        [Bindable(event="propertyChange")]
        public function get slot71():ItemSlot
        {
            return (this._899454632slot71);
        }

        [Bindable(event="propertyChange")]
        public function get slot72():ItemSlot
        {
            return (this._899454631slot72);
        }

        [Bindable(event="propertyChange")]
        public function get slot73():ItemSlot
        {
            return (this._899454630slot73);
        }

        [Bindable(event="propertyChange")]
        public function get slot78():ItemSlot
        {
            return (this._899454625slot78);
        }

        [Bindable(event="propertyChange")]
        public function get slot79():ItemSlot
        {
            return (this._899454624slot79);
        }

        public function set thirdTile(_arg_1:Tile):void
        {
            var _local_2:Object = this._585350987thirdTile;
            if (_local_2 !== _arg_1)
            {
                this._585350987thirdTile = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "thirdTile", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot80():ItemSlot
        {
            return (this._899454602slot80);
        }

        [Bindable(event="propertyChange")]
        public function get slot81():ItemSlot
        {
            return (this._899454601slot81);
        }

        public function set slot20(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454788slot20;
            if (_local_2 !== _arg_1)
            {
                this._899454788slot20 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot20", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot83():ItemSlot
        {
            return (this._899454599slot83);
        }

        [Bindable(event="propertyChange")]
        public function get slot85():ItemSlot
        {
            return (this._899454597slot85);
        }

        [Bindable(event="propertyChange")]
        public function get slot87():ItemSlot
        {
            return (this._899454595slot87);
        }

        public function set slot23(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454785slot23;
            if (_local_2 !== _arg_1)
            {
                this._899454785slot23 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot23", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot82():ItemSlot
        {
            return (this._899454600slot82);
        }

        internal function setSlot(_arg_1:Object):void
        {
            _dm.initGuildSlotData(_arg_1);
        }

        public function set slot21(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454787slot21;
            if (_local_2 !== _arg_1)
            {
                this._899454787slot21 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot21", _local_2, _arg_1));
            };
        }

        public function set slot25(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454783slot25;
            if (_local_2 !== _arg_1)
            {
                this._899454783slot25 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot25", _local_2, _arg_1));
            };
        }

        public function set slot22(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454786slot22;
            if (_local_2 !== _arg_1)
            {
                this._899454786slot22 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot22", _local_2, _arg_1));
            };
        }

        public function set slot26(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454782slot26;
            if (_local_2 !== _arg_1)
            {
                this._899454782slot26 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot26", _local_2, _arg_1));
            };
        }

        public function set slot27(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454781slot27;
            if (_local_2 !== _arg_1)
            {
                this._899454781slot27 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot27", _local_2, _arg_1));
            };
        }

        public function set slot24(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454784slot24;
            if (_local_2 !== _arg_1)
            {
                this._899454784slot24 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot24", _local_2, _arg_1));
            };
        }

        public function set slot28(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454780slot28;
            if (_local_2 !== _arg_1)
            {
                this._899454780slot28 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot28", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot84():ItemSlot
        {
            return (this._899454598slot84);
        }

        [Bindable(event="propertyChange")]
        public function get slot89():ItemSlot
        {
            return (this._899454593slot89);
        }

        [Bindable(event="propertyChange")]
        public function get slot90():ItemSlot
        {
            return (this._899454571slot90);
        }

        [Bindable(event="propertyChange")]
        public function get slot92():ItemSlot
        {
            return (this._899454569slot92);
        }

        [Bindable(event="propertyChange")]
        public function get slot93():ItemSlot
        {
            return (this._899454568slot93);
        }

        [Bindable(event="propertyChange")]
        public function get slot97():ItemSlot
        {
            return (this._899454564slot97);
        }

        [Bindable(event="propertyChange")]
        public function get slot86():ItemSlot
        {
            return (this._899454596slot86);
        }

        [Bindable(event="propertyChange")]
        public function get thirdCanvas():Canvas
        {
            return (this._375587425thirdCanvas);
        }

        [Bindable(event="propertyChange")]
        public function get firstTile():Tile
        {
            return (this._133022078firstTile);
        }

        [Bindable(event="propertyChange")]
        public function get slot98():ItemSlot
        {
            return (this._899454563slot98);
        }

        [Bindable(event="propertyChange")]
        public function get slot91():ItemSlot
        {
            return (this._899454570slot91);
        }

        [Bindable(event="propertyChange")]
        public function get slot96():ItemSlot
        {
            return (this._899454565slot96);
        }

        [Bindable(event="propertyChange")]
        public function get slot88():ItemSlot
        {
            return (this._899454594slot88);
        }

        public function set slot29(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454779slot29;
            if (_local_2 !== _arg_1)
            {
                this._899454779slot29 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot29", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot99():ItemSlot
        {
            return (this._899454562slot99);
        }

        [Bindable(event="propertyChange")]
        public function get slot94():ItemSlot
        {
            return (this._899454567slot94);
        }

        [Bindable(event="propertyChange")]
        public function get fouthCanvas():Canvas
        {
            return (this._162384312fouthCanvas);
        }

        public function set slot34(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454753slot34;
            if (_local_2 !== _arg_1)
            {
                this._899454753slot34 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot34", _local_2, _arg_1));
            };
        }

        public function set slot31(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454756slot31;
            if (_local_2 !== _arg_1)
            {
                this._899454756slot31 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot31", _local_2, _arg_1));
            };
        }

        public function set slot35(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454752slot35;
            if (_local_2 !== _arg_1)
            {
                this._899454752slot35 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot35", _local_2, _arg_1));
            };
        }

        public function set slot32(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454755slot32;
            if (_local_2 !== _arg_1)
            {
                this._899454755slot32 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot32", _local_2, _arg_1));
            };
        }

        public function set slot36(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454751slot36;
            if (_local_2 !== _arg_1)
            {
                this._899454751slot36 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot36", _local_2, _arg_1));
            };
        }

        public function set slot33(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454754slot33;
            if (_local_2 !== _arg_1)
            {
                this._899454754slot33 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot33", _local_2, _arg_1));
            };
        }

        public function set slot37(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454750slot37;
            if (_local_2 !== _arg_1)
            {
                this._899454750slot37 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot37", _local_2, _arg_1));
            };
        }

        public function set slot30(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454757slot30;
            if (_local_2 !== _arg_1)
            {
                this._899454757slot30 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot30", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot95():ItemSlot
        {
            return (this._899454566slot95);
        }

        public function set slot39(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454748slot39;
            if (_local_2 !== _arg_1)
            {
                this._899454748slot39 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot39", _local_2, _arg_1));
            };
        }

        public function set secondCanvas(_arg_1:Canvas):void
        {
            var _local_2:Object = this._1180008724secondCanvas;
            if (_local_2 !== _arg_1)
            {
                this._1180008724secondCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "secondCanvas", _local_2, _arg_1));
            };
        }

        public function set slot38(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454749slot38;
            if (_local_2 !== _arg_1)
            {
                this._899454749slot38 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot38", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot1():ItemSlot
        {
            return (this._109532659slot1);
        }

        [Bindable(event="propertyChange")]
        public function get slot2():ItemSlot
        {
            return (this._109532660slot2);
        }

        [Bindable(event="propertyChange")]
        public function get slot3():ItemSlot
        {
            return (this._109532661slot3);
        }

        [Bindable(event="propertyChange")]
        public function get slot4():ItemSlot
        {
            return (this._109532662slot4);
        }

        [Bindable(event="propertyChange")]
        public function get slot5():ItemSlot
        {
            return (this._109532663slot5);
        }

        [Bindable(event="propertyChange")]
        public function get slot7():ItemSlot
        {
            return (this._109532665slot7);
        }

        public function set slot40(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454726slot40;
            if (_local_2 !== _arg_1)
            {
                this._899454726slot40 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot40", _local_2, _arg_1));
            };
        }

        public function set slot41(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454725slot41;
            if (_local_2 !== _arg_1)
            {
                this._899454725slot41 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot41", _local_2, _arg_1));
            };
        }

        public function set slot45(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454721slot45;
            if (_local_2 !== _arg_1)
            {
                this._899454721slot45 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot45", _local_2, _arg_1));
            };
        }

        public function set slot42(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454724slot42;
            if (_local_2 !== _arg_1)
            {
                this._899454724slot42 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot42", _local_2, _arg_1));
            };
        }

        public function set slot46(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454720slot46;
            if (_local_2 !== _arg_1)
            {
                this._899454720slot46 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot46", _local_2, _arg_1));
            };
        }

        public function set slot43(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454723slot43;
            if (_local_2 !== _arg_1)
            {
                this._899454723slot43 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot43", _local_2, _arg_1));
            };
        }

        public function set slot47(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454719slot47;
            if (_local_2 !== _arg_1)
            {
                this._899454719slot47 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot47", _local_2, _arg_1));
            };
        }

        public function set slot44(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454722slot44;
            if (_local_2 !== _arg_1)
            {
                this._899454722slot44 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot44", _local_2, _arg_1));
            };
        }

        public function set slot49(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454717slot49;
            if (_local_2 !== _arg_1)
            {
                this._899454717slot49 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot49", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot6():ItemSlot
        {
            return (this._109532664slot6);
        }

        [Bindable(event="propertyChange")]
        public function get slot8():ItemSlot
        {
            return (this._109532666slot8);
        }

        [Bindable(event="propertyChange")]
        public function get slot9():ItemSlot
        {
            return (this._109532667slot9);
        }

        public function set slot48(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454718slot48;
            if (_local_2 !== _arg_1)
            {
                this._899454718slot48 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot48", _local_2, _arg_1));
            };
        }

        public function set slot50(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454695slot50;
            if (_local_2 !== _arg_1)
            {
                this._899454695slot50 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot50", _local_2, _arg_1));
            };
        }

        public function set slot54(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454691slot54;
            if (_local_2 !== _arg_1)
            {
                this._899454691slot54 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot54", _local_2, _arg_1));
            };
        }

        public function __tabBtn3_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(3);
        }

        public function set slot53(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454692slot53;
            if (_local_2 !== _arg_1)
            {
                this._899454692slot53 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot53", _local_2, _arg_1));
            };
        }

        public function set slot57(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454688slot57;
            if (_local_2 !== _arg_1)
            {
                this._899454688slot57 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot57", _local_2, _arg_1));
            };
        }

        public function set slot58(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454687slot58;
            if (_local_2 !== _arg_1)
            {
                this._899454687slot58 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot58", _local_2, _arg_1));
            };
        }

        public function set slot51(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454694slot51;
            if (_local_2 !== _arg_1)
            {
                this._899454694slot51 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot51", _local_2, _arg_1));
            };
        }

        public function set slot59(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454686slot59;
            if (_local_2 !== _arg_1)
            {
                this._899454686slot59 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot59", _local_2, _arg_1));
            };
        }

        public function set slot52(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454693slot52;
            if (_local_2 !== _arg_1)
            {
                this._899454693slot52 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot52", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get t4():Tile
        {
            return (this._3648t4);
        }

        public function set slot55(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454690slot55;
            if (_local_2 !== _arg_1)
            {
                this._899454690slot55 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot55", _local_2, _arg_1));
            };
        }

        public function set slot56(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454689slot56;
            if (_local_2 !== _arg_1)
            {
                this._899454689slot56 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot56", _local_2, _arg_1));
            };
        }

        public function set slot100(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113295565slot100;
            if (_local_2 !== _arg_1)
            {
                this._2113295565slot100 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot100", _local_2, _arg_1));
            };
        }

        public function set tnBag(_arg_1:ViewStack):void
        {
            var _local_2:Object = this._110471982tnBag;
            if (_local_2 !== _arg_1)
            {
                this._110471982tnBag = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tnBag", _local_2, _arg_1));
            };
        }

        public function set slot103(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113295562slot103;
            if (_local_2 !== _arg_1)
            {
                this._2113295562slot103 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot103", _local_2, _arg_1));
            };
        }

        public function set slot104(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113295561slot104;
            if (_local_2 !== _arg_1)
            {
                this._2113295561slot104 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot104", _local_2, _arg_1));
            };
        }

        public function set slot101(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113295564slot101;
            if (_local_2 !== _arg_1)
            {
                this._2113295564slot101 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot101", _local_2, _arg_1));
            };
        }

        public function set slot102(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113295563slot102;
            if (_local_2 !== _arg_1)
            {
                this._2113295563slot102 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot102", _local_2, _arg_1));
            };
        }

        public function set slot106(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113295559slot106;
            if (_local_2 !== _arg_1)
            {
                this._2113295559slot106 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot106", _local_2, _arg_1));
            };
        }

        public function set slot108(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113295557slot108;
            if (_local_2 !== _arg_1)
            {
                this._2113295557slot108 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot108", _local_2, _arg_1));
            };
        }

        public function set slot109(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113295556slot109;
            if (_local_2 !== _arg_1)
            {
                this._2113295556slot109 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot109", _local_2, _arg_1));
            };
        }

        public function set slot61(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454663slot61;
            if (_local_2 !== _arg_1)
            {
                this._899454663slot61 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot61", _local_2, _arg_1));
            };
        }

        public function set slot107(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113295558slot107;
            if (_local_2 !== _arg_1)
            {
                this._2113295558slot107 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot107", _local_2, _arg_1));
            };
        }

        public function set slot105(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113295560slot105;
            if (_local_2 !== _arg_1)
            {
                this._2113295560slot105 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot105", _local_2, _arg_1));
            };
        }

        public function set slot68(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454656slot68;
            if (_local_2 !== _arg_1)
            {
                this._899454656slot68 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot68", _local_2, _arg_1));
            };
        }

        public function set slot65(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454659slot65;
            if (_local_2 !== _arg_1)
            {
                this._899454659slot65 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot65", _local_2, _arg_1));
            };
        }

        public function set slot69(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454655slot69;
            if (_local_2 !== _arg_1)
            {
                this._899454655slot69 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot69", _local_2, _arg_1));
            };
        }

        public function set secondTile(_arg_1:Tile):void
        {
            var _local_2:Object = this._423866690secondTile;
            if (_local_2 !== _arg_1)
            {
                this._423866690secondTile = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "secondTile", _local_2, _arg_1));
            };
        }

        public function set slot63(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454661slot63;
            if (_local_2 !== _arg_1)
            {
                this._899454661slot63 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot63", _local_2, _arg_1));
            };
        }

        public function set slot64(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454660slot64;
            if (_local_2 !== _arg_1)
            {
                this._899454660slot64 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot64", _local_2, _arg_1));
            };
        }

        public function set slot60(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454664slot60;
            if (_local_2 !== _arg_1)
            {
                this._899454664slot60 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot60", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn0():BasicGlowButton
        {
            return (this._1554141559tabBtn0);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn1():BasicGlowButton
        {
            return (this._1554141558tabBtn1);
        }

        public function set slot66(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454658slot66;
            if (_local_2 !== _arg_1)
            {
                this._899454658slot66 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot66", _local_2, _arg_1));
            };
        }

        public function set slot62(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454662slot62;
            if (_local_2 !== _arg_1)
            {
                this._899454662slot62 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot62", _local_2, _arg_1));
            };
        }

        public function set slot67(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454657slot67;
            if (_local_2 !== _arg_1)
            {
                this._899454657slot67 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot67", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn2():BasicGlowButton
        {
            return (this._1554141557tabBtn2);
        }

        [Bindable(event="propertyChange")]
        public function get tabBtn3():BasicGlowButton
        {
            return (this._1554141556tabBtn3);
        }

        public function set slot112(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113295532slot112;
            if (_local_2 !== _arg_1)
            {
                this._2113295532slot112 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot112", _local_2, _arg_1));
            };
        }

        public function set slot114(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113295530slot114;
            if (_local_2 !== _arg_1)
            {
                this._2113295530slot114 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot114", _local_2, _arg_1));
            };
        }

        public function set slot111(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113295533slot111;
            if (_local_2 !== _arg_1)
            {
                this._2113295533slot111 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot111", _local_2, _arg_1));
            };
        }

        public function set slot115(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113295529slot115;
            if (_local_2 !== _arg_1)
            {
                this._2113295529slot115 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot115", _local_2, _arg_1));
            };
        }

        public function set slot116(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113295528slot116;
            if (_local_2 !== _arg_1)
            {
                this._2113295528slot116 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot116", _local_2, _arg_1));
            };
        }

        public function set slot113(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113295531slot113;
            if (_local_2 !== _arg_1)
            {
                this._2113295531slot113 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot113", _local_2, _arg_1));
            };
        }

        public function set slot110(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113295534slot110;
            if (_local_2 !== _arg_1)
            {
                this._2113295534slot110 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot110", _local_2, _arg_1));
            };
        }

        public function set slot70(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454633slot70;
            if (_local_2 !== _arg_1)
            {
                this._899454633slot70 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot70", _local_2, _arg_1));
            };
        }

        public function set slot119(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113295525slot119;
            if (_local_2 !== _arg_1)
            {
                this._2113295525slot119 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot119", _local_2, _arg_1));
            };
        }

        public function set slot71(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454632slot71;
            if (_local_2 !== _arg_1)
            {
                this._899454632slot71 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot71", _local_2, _arg_1));
            };
        }

        public function set slot75(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454628slot75;
            if (_local_2 !== _arg_1)
            {
                this._899454628slot75 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot75", _local_2, _arg_1));
            };
        }

        public function set slot117(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113295527slot117;
            if (_local_2 !== _arg_1)
            {
                this._2113295527slot117 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot117", _local_2, _arg_1));
            };
        }

        public function set slot76(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454627slot76;
            if (_local_2 !== _arg_1)
            {
                this._899454627slot76 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot76", _local_2, _arg_1));
            };
        }

        public function set slot118(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113295526slot118;
            if (_local_2 !== _arg_1)
            {
                this._2113295526slot118 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot118", _local_2, _arg_1));
            };
        }

        public function set slot77(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454626slot77;
            if (_local_2 !== _arg_1)
            {
                this._899454626slot77 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot77", _local_2, _arg_1));
            };
        }

        public function set slot74(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454629slot74;
            if (_local_2 !== _arg_1)
            {
                this._899454629slot74 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot74", _local_2, _arg_1));
            };
        }

        public function set slot78(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454625slot78;
            if (_local_2 !== _arg_1)
            {
                this._899454625slot78 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot78", _local_2, _arg_1));
            };
        }

        public function set slot79(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454624slot79;
            if (_local_2 !== _arg_1)
            {
                this._899454624slot79 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot79", _local_2, _arg_1));
            };
        }

        public function set slot72(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454631slot72;
            if (_local_2 !== _arg_1)
            {
                this._899454631slot72 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot72", _local_2, _arg_1));
            };
        }

        public function set slot73(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454630slot73;
            if (_local_2 !== _arg_1)
            {
                this._899454630slot73 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot73", _local_2, _arg_1));
            };
        }

        private function _GuildWarehousePanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDPANEL_U[17];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildWarehousePanel_BasicTitleCanvas1.text = _arg_1;
            }, "_GuildWarehousePanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDWAREHOUSRPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildWarehousePanel_Canvas1.label = _arg_1;
            }, "_GuildWarehousePanel_Canvas1.label");
            result[1] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot1.slotType = _arg_1;
            }, "slot1.slotType");
            result[2] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot2.slotType = _arg_1;
            }, "slot2.slotType");
            result[3] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot3.slotType = _arg_1;
            }, "slot3.slotType");
            result[4] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot4.slotType = _arg_1;
            }, "slot4.slotType");
            result[5] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot5.slotType = _arg_1;
            }, "slot5.slotType");
            result[6] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot6.slotType = _arg_1;
            }, "slot6.slotType");
            result[7] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot7.slotType = _arg_1;
            }, "slot7.slotType");
            result[8] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot8.slotType = _arg_1;
            }, "slot8.slotType");
            result[9] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot9.slotType = _arg_1;
            }, "slot9.slotType");
            result[10] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot10.slotType = _arg_1;
            }, "slot10.slotType");
            result[11] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot11.slotType = _arg_1;
            }, "slot11.slotType");
            result[12] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot12.slotType = _arg_1;
            }, "slot12.slotType");
            result[13] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot13.slotType = _arg_1;
            }, "slot13.slotType");
            result[14] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot14.slotType = _arg_1;
            }, "slot14.slotType");
            result[15] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot15.slotType = _arg_1;
            }, "slot15.slotType");
            result[16] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot16.slotType = _arg_1;
            }, "slot16.slotType");
            result[17] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot17.slotType = _arg_1;
            }, "slot17.slotType");
            result[18] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot18.slotType = _arg_1;
            }, "slot18.slotType");
            result[19] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot19.slotType = _arg_1;
            }, "slot19.slotType");
            result[20] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot20.slotType = _arg_1;
            }, "slot20.slotType");
            result[21] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot21.slotType = _arg_1;
            }, "slot21.slotType");
            result[22] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot22.slotType = _arg_1;
            }, "slot22.slotType");
            result[23] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot23.slotType = _arg_1;
            }, "slot23.slotType");
            result[24] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot24.slotType = _arg_1;
            }, "slot24.slotType");
            result[25] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot25.slotType = _arg_1;
            }, "slot25.slotType");
            result[26] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot26.slotType = _arg_1;
            }, "slot26.slotType");
            result[27] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot27.slotType = _arg_1;
            }, "slot27.slotType");
            result[28] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot28.slotType = _arg_1;
            }, "slot28.slotType");
            result[29] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot29.slotType = _arg_1;
            }, "slot29.slotType");
            result[30] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot30.slotType = _arg_1;
            }, "slot30.slotType");
            result[31] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDWAREHOUSRPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                secondCanvas.label = _arg_1;
            }, "secondCanvas.label");
            result[32] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot31.slotType = _arg_1;
            }, "slot31.slotType");
            result[33] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot32.slotType = _arg_1;
            }, "slot32.slotType");
            result[34] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot33.slotType = _arg_1;
            }, "slot33.slotType");
            result[35] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot34.slotType = _arg_1;
            }, "slot34.slotType");
            result[36] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot35.slotType = _arg_1;
            }, "slot35.slotType");
            result[37] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot36.slotType = _arg_1;
            }, "slot36.slotType");
            result[38] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot37.slotType = _arg_1;
            }, "slot37.slotType");
            result[39] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot38.slotType = _arg_1;
            }, "slot38.slotType");
            result[40] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot39.slotType = _arg_1;
            }, "slot39.slotType");
            result[41] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot40.slotType = _arg_1;
            }, "slot40.slotType");
            result[42] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot41.slotType = _arg_1;
            }, "slot41.slotType");
            result[43] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot42.slotType = _arg_1;
            }, "slot42.slotType");
            result[44] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot43.slotType = _arg_1;
            }, "slot43.slotType");
            result[45] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot44.slotType = _arg_1;
            }, "slot44.slotType");
            result[46] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot45.slotType = _arg_1;
            }, "slot45.slotType");
            result[47] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot46.slotType = _arg_1;
            }, "slot46.slotType");
            result[48] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot47.slotType = _arg_1;
            }, "slot47.slotType");
            result[49] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot48.slotType = _arg_1;
            }, "slot48.slotType");
            result[50] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot49.slotType = _arg_1;
            }, "slot49.slotType");
            result[51] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot50.slotType = _arg_1;
            }, "slot50.slotType");
            result[52] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot51.slotType = _arg_1;
            }, "slot51.slotType");
            result[53] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot52.slotType = _arg_1;
            }, "slot52.slotType");
            result[54] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot53.slotType = _arg_1;
            }, "slot53.slotType");
            result[55] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot54.slotType = _arg_1;
            }, "slot54.slotType");
            result[56] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot55.slotType = _arg_1;
            }, "slot55.slotType");
            result[57] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot56.slotType = _arg_1;
            }, "slot56.slotType");
            result[58] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot57.slotType = _arg_1;
            }, "slot57.slotType");
            result[59] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot58.slotType = _arg_1;
            }, "slot58.slotType");
            result[60] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot59.slotType = _arg_1;
            }, "slot59.slotType");
            result[61] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot60.slotType = _arg_1;
            }, "slot60.slotType");
            result[62] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDWAREHOUSRPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                thirdCanvas.label = _arg_1;
            }, "thirdCanvas.label");
            result[63] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot61.slotType = _arg_1;
            }, "slot61.slotType");
            result[64] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot62.slotType = _arg_1;
            }, "slot62.slotType");
            result[65] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot63.slotType = _arg_1;
            }, "slot63.slotType");
            result[66] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot64.slotType = _arg_1;
            }, "slot64.slotType");
            result[67] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot65.slotType = _arg_1;
            }, "slot65.slotType");
            result[68] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot66.slotType = _arg_1;
            }, "slot66.slotType");
            result[69] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot67.slotType = _arg_1;
            }, "slot67.slotType");
            result[70] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot68.slotType = _arg_1;
            }, "slot68.slotType");
            result[71] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot69.slotType = _arg_1;
            }, "slot69.slotType");
            result[72] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot70.slotType = _arg_1;
            }, "slot70.slotType");
            result[73] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot71.slotType = _arg_1;
            }, "slot71.slotType");
            result[74] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot72.slotType = _arg_1;
            }, "slot72.slotType");
            result[75] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot73.slotType = _arg_1;
            }, "slot73.slotType");
            result[76] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot74.slotType = _arg_1;
            }, "slot74.slotType");
            result[77] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot75.slotType = _arg_1;
            }, "slot75.slotType");
            result[78] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot76.slotType = _arg_1;
            }, "slot76.slotType");
            result[79] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot77.slotType = _arg_1;
            }, "slot77.slotType");
            result[80] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot78.slotType = _arg_1;
            }, "slot78.slotType");
            result[81] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot79.slotType = _arg_1;
            }, "slot79.slotType");
            result[82] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot80.slotType = _arg_1;
            }, "slot80.slotType");
            result[83] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot81.slotType = _arg_1;
            }, "slot81.slotType");
            result[84] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot82.slotType = _arg_1;
            }, "slot82.slotType");
            result[85] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot83.slotType = _arg_1;
            }, "slot83.slotType");
            result[86] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot84.slotType = _arg_1;
            }, "slot84.slotType");
            result[87] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot85.slotType = _arg_1;
            }, "slot85.slotType");
            result[88] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot86.slotType = _arg_1;
            }, "slot86.slotType");
            result[89] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot87.slotType = _arg_1;
            }, "slot87.slotType");
            result[90] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot88.slotType = _arg_1;
            }, "slot88.slotType");
            result[91] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot89.slotType = _arg_1;
            }, "slot89.slotType");
            result[92] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot90.slotType = _arg_1;
            }, "slot90.slotType");
            result[93] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDWAREHOUSRPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                fouthCanvas.label = _arg_1;
            }, "fouthCanvas.label");
            result[94] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot91.slotType = _arg_1;
            }, "slot91.slotType");
            result[95] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot92.slotType = _arg_1;
            }, "slot92.slotType");
            result[96] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot93.slotType = _arg_1;
            }, "slot93.slotType");
            result[97] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot94.slotType = _arg_1;
            }, "slot94.slotType");
            result[98] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot95.slotType = _arg_1;
            }, "slot95.slotType");
            result[99] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot96.slotType = _arg_1;
            }, "slot96.slotType");
            result[100] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot97.slotType = _arg_1;
            }, "slot97.slotType");
            result[101] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot98.slotType = _arg_1;
            }, "slot98.slotType");
            result[102] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot99.slotType = _arg_1;
            }, "slot99.slotType");
            result[103] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot100.slotType = _arg_1;
            }, "slot100.slotType");
            result[104] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot101.slotType = _arg_1;
            }, "slot101.slotType");
            result[105] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot102.slotType = _arg_1;
            }, "slot102.slotType");
            result[106] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot103.slotType = _arg_1;
            }, "slot103.slotType");
            result[107] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot104.slotType = _arg_1;
            }, "slot104.slotType");
            result[108] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot105.slotType = _arg_1;
            }, "slot105.slotType");
            result[109] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot106.slotType = _arg_1;
            }, "slot106.slotType");
            result[110] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot107.slotType = _arg_1;
            }, "slot107.slotType");
            result[111] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot108.slotType = _arg_1;
            }, "slot108.slotType");
            result[112] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot109.slotType = _arg_1;
            }, "slot109.slotType");
            result[113] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot110.slotType = _arg_1;
            }, "slot110.slotType");
            result[114] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot111.slotType = _arg_1;
            }, "slot111.slotType");
            result[115] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot112.slotType = _arg_1;
            }, "slot112.slotType");
            result[116] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot113.slotType = _arg_1;
            }, "slot113.slotType");
            result[117] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot114.slotType = _arg_1;
            }, "slot114.slotType");
            result[118] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot115.slotType = _arg_1;
            }, "slot115.slotType");
            result[119] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot116.slotType = _arg_1;
            }, "slot116.slotType");
            result[120] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot117.slotType = _arg_1;
            }, "slot117.slotType");
            result[121] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot118.slotType = _arg_1;
            }, "slot118.slotType");
            result[122] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot119.slotType = _arg_1;
            }, "slot119.slotType");
            result[123] = binding;
            binding = new Binding(this, function ():int
            {
                return (Slot.SLOT_GUILD);
            }, function (_arg_1:int):void
            {
                slot120.slotType = _arg_1;
            }, "slot120.slotType");
            result[124] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.GUILDWAREHOUSRPANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _GuildWarehousePanel_Label1.text = _arg_1;
            }, "_GuildWarehousePanel_Label1.text");
            result[125] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BANKPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn0.label = _arg_1;
            }, "tabBtn0.label");
            result[126] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BANKPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn1.label = _arg_1;
            }, "tabBtn1.label");
            result[127] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BANKPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn2.label = _arg_1;
            }, "tabBtn2.label");
            result[128] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.BANKPANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                tabBtn3.label = _arg_1;
            }, "tabBtn3.label");
            result[129] = binding;
            return (result);
        }

        public function set slot120(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._2113295503slot120;
            if (_local_2 !== _arg_1)
            {
                this._2113295503slot120 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot120", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get secondCanvas():Canvas
        {
            return (this._1180008724secondCanvas);
        }

        public function set slot81(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454601slot81;
            if (_local_2 !== _arg_1)
            {
                this._899454601slot81 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot81", _local_2, _arg_1));
            };
        }

        public function set slot82(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454600slot82;
            if (_local_2 !== _arg_1)
            {
                this._899454600slot82 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot82", _local_2, _arg_1));
            };
        }

        public function set slot83(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454599slot83;
            if (_local_2 !== _arg_1)
            {
                this._899454599slot83 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot83", _local_2, _arg_1));
            };
        }

        public function set slot80(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454602slot80;
            if (_local_2 !== _arg_1)
            {
                this._899454602slot80 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot80", _local_2, _arg_1));
            };
        }

        public function set slot85(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454597slot85;
            if (_local_2 !== _arg_1)
            {
                this._899454597slot85 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot85", _local_2, _arg_1));
            };
        }

        public function set slot86(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454596slot86;
            if (_local_2 !== _arg_1)
            {
                this._899454596slot86 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot86", _local_2, _arg_1));
            };
        }

        public function __tabBtn2_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(2);
        }

        public function set slot87(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454595slot87;
            if (_local_2 !== _arg_1)
            {
                this._899454595slot87 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot87", _local_2, _arg_1));
            };
        }

        public function set slot89(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454593slot89;
            if (_local_2 !== _arg_1)
            {
                this._899454593slot89 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot89", _local_2, _arg_1));
            };
        }

        public function set firstTile(_arg_1:Tile):void
        {
            var _local_2:Object = this._133022078firstTile;
            if (_local_2 !== _arg_1)
            {
                this._133022078firstTile = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "firstTile", _local_2, _arg_1));
            };
        }

        public function set slot84(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454598slot84;
            if (_local_2 !== _arg_1)
            {
                this._899454598slot84 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot84", _local_2, _arg_1));
            };
        }

        public function updateView():void
        {
            var _local_1:Object;
            var _local_2:int;
            var _local_3:Object;
            for each (_local_1 in _dm.gsList)
            {
                if (((ToolKit.isBigThan(_local_1.sid, GamePredef.SLOT_SID_GUILD_BANK[0])) && (ToolKit.isSmallOrEqual(_local_1.sid, GamePredef.SLOT_SID_GUILD_BANK[_core.player.guild.bagSlotNum]))))
                {
                    _local_3 = _core.view.getSlot(_local_1.sid);
                    _local_3.slotData = _local_1;
                    _local_3.type = _local_1.type;
                    _local_3.giid = _local_1.itemId;
                    _local_3.stackNum = _local_1.stackNum;
                };
            };
            _local_2 = (GamePredef.SLOT_SID_GUILD_BANK[0] + 1);
            while (_local_2 <= GamePredef.SLOT_SID_GUILD_BANK[_core.player.guild.bagSlotNum])
            {
                _core.view.getSlot(_local_2).update();
                _local_2++;
            };
            if (ToolKit.isEqual(_core.player.guild.bagSlotNum, 2))
            {
                tabBtn1.enabled = true;
                tabBtn2.enabled = false;
                tabBtn3.enabled = false;
            }
            else
            {
                if (ToolKit.isEqual(_core.player.guild.bagSlotNum, 3))
                {
                    tabBtn1.enabled = true;
                    tabBtn2.enabled = true;
                    tabBtn3.enabled = false;
                }
                else
                {
                    if (ToolKit.isEqual(_core.player.guild.bagSlotNum, 4))
                    {
                        tabBtn1.enabled = true;
                        tabBtn2.enabled = true;
                        tabBtn3.enabled = true;
                    };
                };
            };
        }

        public function set slot88(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454594slot88;
            if (_local_2 !== _arg_1)
            {
                this._899454594slot88 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot88", _local_2, _arg_1));
            };
        }

        public function set slot90(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454571slot90;
            if (_local_2 !== _arg_1)
            {
                this._899454571slot90 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot90", _local_2, _arg_1));
            };
        }

        public function set slot92(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454569slot92;
            if (_local_2 !== _arg_1)
            {
                this._899454569slot92 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot92", _local_2, _arg_1));
            };
        }

        public function set slot93(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454568slot93;
            if (_local_2 !== _arg_1)
            {
                this._899454568slot93 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot93", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot102():ItemSlot
        {
            return (this._2113295563slot102);
        }

        [Bindable(event="propertyChange")]
        public function get slot104():ItemSlot
        {
            return (this._2113295561slot104);
        }

        [Bindable(event="propertyChange")]
        public function get slot105():ItemSlot
        {
            return (this._2113295560slot105);
        }

        [Bindable(event="propertyChange")]
        public function get slot109():ItemSlot
        {
            return (this._2113295556slot109);
        }

        public function set slot97(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454564slot97;
            if (_local_2 !== _arg_1)
            {
                this._899454564slot97 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot97", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot106():ItemSlot
        {
            return (this._2113295559slot106);
        }

        private function tabBtnClick(_arg_1:int):void
        {
            tnBag.selectedIndex = _arg_1;
        }

        [Bindable(event="propertyChange")]
        public function get slot100():ItemSlot
        {
            return (this._2113295565slot100);
        }

        [Bindable(event="propertyChange")]
        public function get slot101():ItemSlot
        {
            return (this._2113295564slot101);
        }

        public function set slot91(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454570slot91;
            if (_local_2 !== _arg_1)
            {
                this._899454570slot91 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot91", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot103():ItemSlot
        {
            return (this._2113295562slot103);
        }

        [Bindable(event="propertyChange")]
        public function get slot107():ItemSlot
        {
            return (this._2113295558slot107);
        }

        public function set slot99(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454562slot99;
            if (_local_2 !== _arg_1)
            {
                this._899454562slot99 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot99", _local_2, _arg_1));
            };
        }

        public function set slot95(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454566slot95;
            if (_local_2 !== _arg_1)
            {
                this._899454566slot95 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot95", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get tnBag():ViewStack
        {
            return (this._110471982tnBag);
        }

        [Bindable(event="propertyChange")]
        public function get slot110():ItemSlot
        {
            return (this._2113295534slot110);
        }

        [Bindable(event="propertyChange")]
        public function get slot111():ItemSlot
        {
            return (this._2113295533slot111);
        }

        [Bindable(event="propertyChange")]
        public function get slot112():ItemSlot
        {
            return (this._2113295532slot112);
        }

        [Bindable(event="propertyChange")]
        public function get slot114():ItemSlot
        {
            return (this._2113295530slot114);
        }

        [Bindable(event="propertyChange")]
        public function get slot115():ItemSlot
        {
            return (this._2113295529slot115);
        }

        [Bindable(event="propertyChange")]
        public function get slot116():ItemSlot
        {
            return (this._2113295528slot116);
        }

        [Bindable(event="propertyChange")]
        public function get slot119():ItemSlot
        {
            return (this._2113295525slot119);
        }

        [Bindable(event="propertyChange")]
        public function get slot113():ItemSlot
        {
            return (this._2113295531slot113);
        }

        public function set slot94(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454567slot94;
            if (_local_2 !== _arg_1)
            {
                this._899454567slot94 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot94", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot117():ItemSlot
        {
            return (this._2113295527slot117);
        }

        [Bindable(event="propertyChange")]
        public function get slot118():ItemSlot
        {
            return (this._2113295526slot118);
        }

        public function set slot98(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454563slot98;
            if (_local_2 !== _arg_1)
            {
                this._899454563slot98 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot98", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot108():ItemSlot
        {
            return (this._2113295557slot108);
        }

        public function set thirdCanvas(_arg_1:Canvas):void
        {
            var _local_2:Object = this._375587425thirdCanvas;
            if (_local_2 !== _arg_1)
            {
                this._375587425thirdCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "thirdCanvas", _local_2, _arg_1));
            };
        }

        public function set slot96(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._899454565slot96;
            if (_local_2 !== _arg_1)
            {
                this._899454565slot96 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot96", _local_2, _arg_1));
            };
        }

        public function set fouthCanvas(_arg_1:Canvas):void
        {
            var _local_2:Object = this._162384312fouthCanvas;
            if (_local_2 !== _arg_1)
            {
                this._162384312fouthCanvas = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fouthCanvas", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get slot120():ItemSlot
        {
            return (this._2113295503slot120);
        }

        override public function initialize():void
        {
            var target:GuildWarehousePanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _GuildWarehousePanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_GuildWarehousePanelWatcherSetupUtil");
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

        public function __tabBtn1_click(_arg_1:MouseEvent):void
        {
            tabBtnClick(1);
        }

        override public function initView():void
        {
            if (!initialized)
            {
                addEventListener(FlexEvent.CREATION_COMPLETE, completeHandler);
                return;
            };
            if (!_dm.gsInited)
            {
                Core.getInstance().remote.call("getInitGuildSlot", new Responder(setSlot));
            }
            else
            {
                updateView();
            };
        }

        public function set slot1(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._109532659slot1;
            if (_local_2 !== _arg_1)
            {
                this._109532659slot1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot1", _local_2, _arg_1));
            };
        }

        public function set slot2(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._109532660slot2;
            if (_local_2 !== _arg_1)
            {
                this._109532660slot2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot2", _local_2, _arg_1));
            };
        }

        public function set slot5(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._109532663slot5;
            if (_local_2 !== _arg_1)
            {
                this._109532663slot5 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot5", _local_2, _arg_1));
            };
        }

        public function set slot6(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._109532664slot6;
            if (_local_2 !== _arg_1)
            {
                this._109532664slot6 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot6", _local_2, _arg_1));
            };
        }

        public function set slot3(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._109532661slot3;
            if (_local_2 !== _arg_1)
            {
                this._109532661slot3 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot3", _local_2, _arg_1));
            };
        }

        public function set slot7(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._109532665slot7;
            if (_local_2 !== _arg_1)
            {
                this._109532665slot7 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot7", _local_2, _arg_1));
            };
        }

        public function set slot4(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._109532662slot4;
            if (_local_2 !== _arg_1)
            {
                this._109532662slot4 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot4", _local_2, _arg_1));
            };
        }

        public function set slot8(_arg_1:ItemSlot):void
        {
            var _local_2:Object = this._109532666slot8;
            if (_local_2 !== _arg_1)
            {
                this._109532666slot8 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "slot8", _local_2, _arg_1));
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

