"use client"

import { useState } from "react"
import {
    Card,
    CardContent,
    CardDescription,
    CardHeader,
    CardTitle,
} from "@/components/ui/card"
import { Input } from "@/components/ui/input"
import { Button } from "@/components/ui/button"
import { Badge } from "@/components/ui/badge"
import {
    Table,
    TableBody,
    TableCell,
    TableHead,
    TableHeader,
    TableRow,
} from "@/components/ui/table"
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs"
import {
    Dialog,
    DialogContent,
    DialogDescription,
    DialogHeader,
    DialogTitle,
    DialogTrigger,
} from "@/components/ui/dialog"
import { Label } from "@/components/ui/label"
import {
    Search,
    DollarSign,
    AlertTriangle,
    Package,
    TrendingUp,
    Edit,
} from "lucide-react"

// Constants
import {
    TRANSACTION_TYPES,
    ALERT_TYPES,
    CURRENCY_TYPES,
} from "@/constants/economy"

// Types
import type { Transaction, ShopItem, EconomyAlert } from "@/types"

// Hooks
import { useEconomyActions } from "@/hooks/use-actions"

export default function EconomyPage() {
    const [searchTerm, setSearchTerm] = useState("")
    const [selectedItem, setSelectedItem] = useState<ShopItem | null>(null)

    // Actions
    const { updateShopItem, createShopItem } = useEconomyActions()

    const transactions: Transaction[] = []
    const shopItems: ShopItem[] = []
    const economyAlerts: EconomyAlert[] = []
    const suspiciousTransactions = transactions.filter(t => t.suspicious)

    const getTransactionLabel = (type: keyof typeof TRANSACTION_TYPES) =>
        TRANSACTION_TYPES[type].label
    const getAlertConfig = (type: keyof typeof ALERT_TYPES) => ALERT_TYPES[type]
    const getCurrencyConfig = (currency: keyof typeof CURRENCY_TYPES) =>
        CURRENCY_TYPES[currency]

    const handleSaveShopItem = () => {
        if (selectedItem) {
            updateShopItem(selectedItem.name)
        }
    }

    const handleCreateShopItem = () => {
        createShopItem()
    }

    return (
        <div className="space-y-6">
            {/* Economy Stats */}
            <div className="grid gap-4 md:grid-cols-4">
                <Card>
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium">
                            Total transactions today
                        </CardTitle>
                        <DollarSign className="h-4 w-4 text-muted-foreground" />
                    </CardHeader>
                    <CardContent>
                        <div className="text-2xl font-bold">15,234</div>
                        <p className="text-xs text-muted-foreground">
                            +8.2% from yesterday
                        </p>
                    </CardContent>
                </Card>
                <Card>
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium">
                            Transaction value
                        </CardTitle>
                        <TrendingUp className="h-4 w-4 text-muted-foreground" />
                    </CardHeader>
                    <CardContent>
                        <div className="text-2xl font-bold">$12,456</div>
                        <p className="text-xs text-muted-foreground">
                            +12.5% from yesterday
                        </p>
                    </CardContent>
                </Card>
                <Card>
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium">
                            Suspicious transactions
                        </CardTitle>
                        <AlertTriangle className="h-4 w-4 text-muted-foreground" />
                    </CardHeader>
                    <CardContent>
                        <div className="text-2xl font-bold text-yellow-500">
                            {suspiciousTransactions.length}
                        </div>
                        <p className="text-xs text-muted-foreground">
                            Needs review
                        </p>
                    </CardContent>
                </Card>
                <Card>
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                        <CardTitle className="text-sm font-medium">
                            Items in shop
                        </CardTitle>
                        <Package className="h-4 w-4 text-muted-foreground" />
                    </CardHeader>
                    <CardContent>
                        <div className="text-2xl font-bold">
                            {shopItems.length}
                        </div>
                        <p className="text-xs text-muted-foreground">
                            Currently on sale
                        </p>
                    </CardContent>
                </Card>
            </div>

            {/* Alerts */}
            <Card className="border-yellow-500/50">
                <CardHeader>
                    <CardTitle className="flex items-center gap-2">
                        <AlertTriangle className="h-5 w-5 text-yellow-500" />
                        Economy alerts
                    </CardTitle>
                </CardHeader>
                <CardContent>
                    {economyAlerts.length === 0 ? (
                        <p className="text-sm text-muted-foreground">
                            No alerts.
                        </p>
                    ) : (
                        <div className="space-y-3">
                            {economyAlerts.map(alert => {
                                const config = getAlertConfig(
                                    alert.type as keyof typeof ALERT_TYPES
                                )
                                return (
                                    <div
                                        key={alert.id}
                                        className={`flex items-start gap-3 p-3 rounded-lg ${config.bg}`}
                                    >
                                        <AlertTriangle
                                            className={`h-5 w-5 mt-0.5 ${config.color}`}
                                        />
                                        <div className="flex-1">
                                            <p className="text-sm">
                                                {alert.message}
                                            </p>
                                            <p className="text-xs text-muted-foreground">
                                                {alert.time}
                                            </p>
                                        </div>
                                        <Badge
                                            variant={
                                                alert.type === "critical"
                                                    ? "destructive"
                                                    : "warning"
                                            }
                                        >
                                            {config.label}
                                        </Badge>
                                    </div>
                                )
                            })}
                        </div>
                    )}
                </CardContent>
            </Card>

            <Tabs defaultValue="transactions" className="space-y-4">
                <TabsList>
                    <TabsTrigger value="transactions">
                        Transaction log
                    </TabsTrigger>
                    <TabsTrigger value="shop">Shop management</TabsTrigger>
                    <TabsTrigger value="suspicious">
                        Suspicious transactions
                    </TabsTrigger>
                </TabsList>

                <TabsContent value="transactions" className="space-y-4">
                    <Card>
                        <CardHeader>
                            <CardTitle>Transaction history</CardTitle>
                            <CardDescription>
                                All in-game transactions
                            </CardDescription>
                        </CardHeader>
                        <CardContent>
                            <div className="mb-4">
                                <div className="relative">
                                    <Search className="absolute left-3 top-1/2 h-4 w-4 -translate-y-1/2 text-muted-foreground" />
                                    <Input
                                        placeholder="Search transactions..."
                                        value={searchTerm}
                                        onChange={e =>
                                            setSearchTerm(e.target.value)
                                        }
                                        className="pl-10"
                                    />
                                </div>
                            </div>
                            {transactions.length === 0 ? (
                                <p className="text-sm text-muted-foreground">
                                    No transactions yet.
                                </p>
                            ) : (
                                <Table>
                                    <TableHeader>
                                        <TableRow>
                                            <TableHead>ID</TableHead>
                                            <TableHead>Player</TableHead>
                                            <TableHead>Type</TableHead>
                                            <TableHead>Amount</TableHead>
                                            <TableHead>Currency</TableHead>
                                            <TableHead>Description</TableHead>
                                            <TableHead>Time</TableHead>
                                        </TableRow>
                                    </TableHeader>
                                    <TableBody>
                                        {transactions.map(transaction => (
                                            <TableRow key={transaction.id}>
                                                <TableCell className="font-mono">
                                                    {transaction.id}
                                                </TableCell>
                                                <TableCell>
                                                    <div>
                                                        <p className="font-medium">
                                                            {
                                                                transaction.playerName
                                                            }
                                                        </p>
                                                        <p className="text-xs text-muted-foreground">
                                                            {
                                                                transaction.playerId
                                                            }
                                                        </p>
                                                    </div>
                                                </TableCell>
                                                <TableCell>
                                                    <Badge variant="outline">
                                                        {getTransactionLabel(
                                                            transaction.type as keyof typeof TRANSACTION_TYPES
                                                        )}
                                                    </Badge>
                                                </TableCell>
                                                <TableCell className="font-medium">
                                                    {transaction.amount.toLocaleString()}
                                                </TableCell>
                                                <TableCell>
                                                    <Badge
                                                        variant={
                                                            transaction.currency ===
                                                            "gems"
                                                                ? "warning"
                                                                : "secondary"
                                                        }
                                                    >
                                                        {transaction.currency}
                                                    </Badge>
                                                </TableCell>
                                                <TableCell className="text-sm max-w-xs truncate">
                                                    {transaction.description}
                                                </TableCell>
                                                <TableCell className="text-sm">
                                                    {transaction.timestamp}
                                                </TableCell>
                                            </TableRow>
                                        ))}
                                    </TableBody>
                                </Table>
                            )}
                        </CardContent>
                    </Card>
                </TabsContent>

                <TabsContent value="shop" className="space-y-4">
                    <Card>
                        <CardHeader>
                            <div className="flex items-center justify-between">
                                <div>
                                    <CardTitle>Shop management</CardTitle>
                                    <CardDescription>
                                        Configure prices and items in the shop
                                    </CardDescription>
                                </div>
                                <Button onClick={handleCreateShopItem}>
                                    <Package className="h-4 w-4 mr-2" />
                                    Add item
                                </Button>
                            </div>
                        </CardHeader>
                        <CardContent>
                            {shopItems.length === 0 ? (
                                <p className="text-sm text-muted-foreground">
                                    No shop items configured.
                                </p>
                            ) : (
                                <Table>
                                    <TableHeader>
                                        <TableRow>
                                            <TableHead>Item</TableHead>
                                            <TableHead>Type</TableHead>
                                            <TableHead>Price</TableHead>
                                            <TableHead>Currency</TableHead>
                                            <TableHead>Stock</TableHead>
                                            <TableHead>Category</TableHead>
                                            <TableHead>Action</TableHead>
                                        </TableRow>
                                    </TableHeader>
                                    <TableBody>
                                        {shopItems.map(item => (
                                            <TableRow key={item.id}>
                                                <TableCell className="font-medium">
                                                    {item.name}
                                                </TableCell>
                                                <TableCell>
                                                    <Badge variant="outline">
                                                        {item.type}
                                                    </Badge>
                                                </TableCell>
                                                <TableCell>
                                                    {item.price}
                                                </TableCell>
                                                <TableCell>
                                                    <Badge
                                                        variant={
                                                            item.currency ===
                                                            "gems"
                                                                ? "warning"
                                                                : "secondary"
                                                        }
                                                    >
                                                        {item.currency}
                                                    </Badge>
                                                </TableCell>
                                                <TableCell>
                                                    {item.stock === -1 ? (
                                                        <Badge variant="success">
                                                            Unlimited
                                                        </Badge>
                                                    ) : (
                                                        <span>
                                                            {item.stock}
                                                        </span>
                                                    )}
                                                </TableCell>
                                                <TableCell>
                                                    {item.category}
                                                </TableCell>
                                                <TableCell>
                                                    <Dialog>
                                                        <DialogTrigger asChild>
                                                            <Button
                                                                variant="ghost"
                                                                size="sm"
                                                                onClick={() =>
                                                                    setSelectedItem(
                                                                        item
                                                                    )
                                                                }
                                                            >
                                                                <Edit className="h-4 w-4" />
                                                            </Button>
                                                        </DialogTrigger>
                                                        <DialogContent>
                                                            <DialogHeader>
                                                                <DialogTitle>
                                                                    Edit{" "}
                                                                    {
                                                                        selectedItem?.name
                                                                    }
                                                                </DialogTitle>
                                                            </DialogHeader>
                                                            <div className="space-y-4 py-4">
                                                                <div>
                                                                    <Label>
                                                                        Price (
                                                                        {
                                                                            selectedItem?.currency
                                                                        }
                                                                        )
                                                                    </Label>
                                                                    <Input
                                                                        type="number"
                                                                        defaultValue={
                                                                            selectedItem?.price
                                                                        }
                                                                    />
                                                                </div>
                                                                <div>
                                                                    <Label>
                                                                        Stock
                                                                    </Label>
                                                                    <Input
                                                                        type="number"
                                                                        defaultValue={
                                                                            selectedItem?.stock ===
                                                                            -1
                                                                                ? "-1"
                                                                                : selectedItem?.stock
                                                                        }
                                                                    />
                                                                    <p className="text-xs text-muted-foreground mt-1">
                                                                        Enter -1
                                                                        for
                                                                        unlimited
                                                                    </p>
                                                                </div>
                                                            </div>
                                                            <div className="flex justify-end gap-2">
                                                                <Button variant="outline">
                                                                    Cancel
                                                                </Button>
                                                                <Button
                                                                    onClick={
                                                                        handleSaveShopItem
                                                                    }
                                                                >
                                                                    Save
                                                                </Button>
                                                            </div>
                                                        </DialogContent>
                                                    </Dialog>
                                                </TableCell>
                                            </TableRow>
                                        ))}
                                    </TableBody>
                                </Table>
                            )}
                        </CardContent>
                    </Card>
                </TabsContent>

                <TabsContent value="suspicious" className="space-y-4">
                    <Card className="border-yellow-500/50">
                        <CardHeader>
                            <CardTitle className="flex items-center gap-2">
                                <AlertTriangle className="h-5 w-5 text-yellow-500" />
                                Suspicious transactions
                            </CardTitle>
                            <CardDescription>
                                Transactions that need review
                            </CardDescription>
                        </CardHeader>
                        <CardContent>
                            {suspiciousTransactions.length === 0 ? (
                                <p className="text-sm text-muted-foreground">
                                    No suspicious transactions.
                                </p>
                            ) : (
                                <Table>
                                    <TableHeader>
                                        <TableRow>
                                            <TableHead>ID</TableHead>
                                            <TableHead>Player</TableHead>
                                            <TableHead>Type</TableHead>
                                            <TableHead>Amount</TableHead>
                                            <TableHead>Description</TableHead>
                                            <TableHead>Time</TableHead>
                                            <TableHead>Action</TableHead>
                                        </TableRow>
                                    </TableHeader>
                                    <TableBody>
                                        {suspiciousTransactions.map(
                                            transaction => (
                                                <TableRow
                                                    key={transaction.id}
                                                    className="bg-yellow-500/5"
                                                >
                                                    <TableCell className="font-mono">
                                                        {transaction.id}
                                                    </TableCell>
                                                    <TableCell>
                                                        <div>
                                                            <p className="font-medium">
                                                                {
                                                                    transaction.playerName
                                                                }
                                                            </p>
                                                            <p className="text-xs text-muted-foreground">
                                                                {
                                                                    transaction.playerId
                                                                }
                                                            </p>
                                                        </div>
                                                    </TableCell>
                                                    <TableCell>
                                                        <Badge variant="outline">
                                                            {transaction.type}
                                                        </Badge>
                                                    </TableCell>
                                                    <TableCell className="font-medium text-yellow-500">
                                                        {transaction.amount.toLocaleString()}
                                                    </TableCell>
                                                    <TableCell className="text-sm">
                                                        {
                                                            transaction.description
                                                        }
                                                    </TableCell>
                                                    <TableCell className="text-sm">
                                                        {transaction.timestamp}
                                                    </TableCell>
                                                    <TableCell>
                                                        <Button
                                                            variant="outline"
                                                            size="sm"
                                                        >
                                                            Details
                                                        </Button>
                                                    </TableCell>
                                                </TableRow>
                                            )
                                        )}
                                    </TableBody>
                                </Table>
                            )}
                        </CardContent>
                    </Card>
                </TabsContent>
            </Tabs>
        </div>
    )
}
