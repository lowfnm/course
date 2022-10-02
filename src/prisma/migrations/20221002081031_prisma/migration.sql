-- CreateTable
CREATE TABLE "Feed" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "authorId" TEXT,

    CONSTRAINT "Feed_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Bundle" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "authorId" TEXT,

    CONSTRAINT "Bundle_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "auth0" TEXT NOT NULL,
    "nickname" TEXT,
    "picture" TEXT,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SavedArticle" (
    "id" TEXT NOT NULL,
    "content" JSONB NOT NULL,
    "feedId" TEXT,
    "authorId" TEXT,

    CONSTRAINT "SavedArticle_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BundleTag" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "BundleTag_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "FeedTag" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "FeedTag_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_FeedToFeedTag" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_FeedUserLikes" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_BundleToBundleTag" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_BundleUserLikes" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Feed_url_key" ON "Feed"("url");

-- CreateIndex
CREATE UNIQUE INDEX "User_auth0_key" ON "User"("auth0");

-- CreateIndex
CREATE UNIQUE INDEX "BundleTag_name_key" ON "BundleTag"("name");

-- CreateIndex
CREATE UNIQUE INDEX "FeedTag_name_key" ON "FeedTag"("name");

-- CreateIndex
CREATE UNIQUE INDEX "_FeedToFeedTag_AB_unique" ON "_FeedToFeedTag"("A", "B");

-- CreateIndex
CREATE INDEX "_FeedToFeedTag_B_index" ON "_FeedToFeedTag"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_FeedUserLikes_AB_unique" ON "_FeedUserLikes"("A", "B");

-- CreateIndex
CREATE INDEX "_FeedUserLikes_B_index" ON "_FeedUserLikes"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_BundleToBundleTag_AB_unique" ON "_BundleToBundleTag"("A", "B");

-- CreateIndex
CREATE INDEX "_BundleToBundleTag_B_index" ON "_BundleToBundleTag"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_BundleUserLikes_AB_unique" ON "_BundleUserLikes"("A", "B");

-- CreateIndex
CREATE INDEX "_BundleUserLikes_B_index" ON "_BundleUserLikes"("B");

-- AddForeignKey
ALTER TABLE "Feed" ADD CONSTRAINT "Feed_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Bundle" ADD CONSTRAINT "Bundle_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SavedArticle" ADD CONSTRAINT "SavedArticle_feedId_fkey" FOREIGN KEY ("feedId") REFERENCES "Feed"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SavedArticle" ADD CONSTRAINT "SavedArticle_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FeedToFeedTag" ADD CONSTRAINT "_FeedToFeedTag_A_fkey" FOREIGN KEY ("A") REFERENCES "Feed"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FeedToFeedTag" ADD CONSTRAINT "_FeedToFeedTag_B_fkey" FOREIGN KEY ("B") REFERENCES "FeedTag"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FeedUserLikes" ADD CONSTRAINT "_FeedUserLikes_A_fkey" FOREIGN KEY ("A") REFERENCES "Feed"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FeedUserLikes" ADD CONSTRAINT "_FeedUserLikes_B_fkey" FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_BundleToBundleTag" ADD CONSTRAINT "_BundleToBundleTag_A_fkey" FOREIGN KEY ("A") REFERENCES "Bundle"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_BundleToBundleTag" ADD CONSTRAINT "_BundleToBundleTag_B_fkey" FOREIGN KEY ("B") REFERENCES "BundleTag"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_BundleUserLikes" ADD CONSTRAINT "_BundleUserLikes_A_fkey" FOREIGN KEY ("A") REFERENCES "Bundle"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_BundleUserLikes" ADD CONSTRAINT "_BundleUserLikes_B_fkey" FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
